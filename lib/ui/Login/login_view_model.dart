import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/providers/event_list_provider.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/ui/home_screen.dart';
import 'package:event_planning_ass/ui/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
//hold data

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late RegisterOrLoginNavigator loginNavigator;

//handle logic
  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //loading
      loginNavigator.showLoading("Loading...");

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        var user = await FirebaseUtilis.readUserFromFireStore(
            credential.user?.uid ?? "");

        if (user == null) {
          return;
        }
        UserProvider userprovider =
            Provider.of<UserProvider>(context, listen: false);
        EventListProvider eventprovider =
            Provider.of<EventListProvider>(context, listen: false);
        userprovider.updateUser(user);
        eventprovider.getAllEvent(userprovider.currentuser!.id!);

        eventprovider.getFavouriteEvent(userprovider.currentuser!.id!);
        loginNavigator.hide();
        loginNavigator.showMessage('Login sucuessfully', () {
          Navigator.pushReplacementNamed(context, HomeScreen.homeScreenId);
        });
      } catch (e) {
        //hide loading
        //show message

        loginNavigator.hide();
        loginNavigator.showMessage(e.toString(), () {
          Navigator.pop(context);
        });
        print(e.toString());
      }

      //    Navigator.pushReplacementNamed(   context, HomeScreen.homeScreenId);
    }
  }
}
