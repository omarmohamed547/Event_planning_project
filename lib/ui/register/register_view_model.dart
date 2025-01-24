import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/model/User_model.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/ui/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewModel extends ChangeNotifier {
  //hold data
  var emailController = TextEditingController();

  var nameController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  late RegisterOrLoginNavigator registerNavigator;
  //handle Logic
  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //loading
      registerNavigator.showLoading("Loading...");
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        UserModel userModel = UserModel(
            email: emailController.text,
            name: nameController.text,
            id: credential.user?.uid ?? "");
        await FirebaseUtilis.addUserToFireStore(userModel);
        UserProvider userprovider =
            Provider.of<UserProvider>(context, listen: false);
        userprovider.updateUser(userModel);

        //  await credential.user  ?.updateProfile(displayName: nameController.text);

        registerNavigator.hide();
        registerNavigator.showMessage('Register sucuessfully', () {
          Navigator.pop(context);
        });

        //hide loading
        //show message
        print("sucess");
      } catch (e) {
        registerNavigator.hide();
        registerNavigator.showMessage(e.toString(), () {
          Navigator.pop(context);
        });

        //hide loading
        //show message
        print(e);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text('register successfuly'))),
      );
    }
  }
}
