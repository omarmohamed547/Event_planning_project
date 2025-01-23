import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/model/User_model.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:event_planning_ass/utilis/custom_elevated_button.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:event_planning_ass/utilis/dailog_utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String registerScreenId = "RegisterScreen";
  bool obscureText;
  RegisterScreen({super.key, this.obscureText = false});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(height: height * 0.3, AssetManager.logoLoginImage),
              CustomTextField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this filled is required";
                  } else {
                    return null;
                  }
                },
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                hintText: AppLocalizations.of(context)!.name,
                prefixIcon: Image.asset("assets/images/UserIcon.png"),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this filled is required";
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (!emailValid) {
                    return "please enter a valid email";
                  }

                  return null;
                },
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: Image.asset("assets/images/EmailIcon.png"),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                obscureText: widget.obscureText,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this filled is required";
                  } else {
                    return null;
                  }
                },
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                hintText: AppLocalizations.of(context)!.password,
                suffixxIcon: InkWell(
                    onTap: () {
                      widget.obscureText = !widget.obscureText;
                      setState(() {});
                    },
                    child: widget.obscureText
                        ? Image.asset("assets/icons/obscureIcon.png")
                        : Icon(Icons.visibility_sharp)),
                prefixIcon: Image.asset("assets/icons/passIcon.png"),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                obscureText: widget.obscureText,
                controller: rePasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this filled is required";
                  }
                  if (value != passwordController.text) {
                    return "the password is doenot match";
                  }
                  return null;
                },
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                hintText: AppLocalizations.of(context)!.repassword,
                suffixxIcon: InkWell(
                    onTap: () {
                      widget.obscureText = !widget.obscureText;
                      setState(() {});
                    },
                    child: widget.obscureText
                        ? Image.asset("assets/icons/obscureIcon.png")
                        : Icon(Icons.visibility_sharp)),
                prefixIcon: Image.asset("assets/icons/passIcon.png"),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              custom_elevated_button(
                onButtonClicked: () async {
                  if (_formKey.currentState!.validate()) {
                    //loading
                    DailogUtilis.showLoading(
                        context: context, message: "Loading..");
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
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

                      DailogUtilis.hideLoading(context: context);
                      DailogUtilis.showMessage(
                          context: context,
                          message: 'Register sucuessfully ',
                          title: "Register",
                          postActionname: "Ok",
                          postActionFunc: () {
                            Navigator.pop(context);
                          });
                      //hide loading
                      //show message
                      print("sucess");
                    } catch (e) {
                      DailogUtilis.hideLoading(context: context);
                      DailogUtilis.showMessage(
                        context: context,
                        message: e.toString(),
                        title: "Error",
                        postActionname: "Ok",
                      );
                      //hide loading
                      //show message
                      print(e);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Center(child: Text('register successfuly'))),
                    );
                  }
                },
                text: AppLocalizations.of(context)!.create_acc,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.alredy_acc,
                      style:
                          AppStyle.Medium16White.copyWith(color: Colors.black)),
                  TextSpan(
                      text: AppLocalizations.of(context)!.login,
                      style: AppStyle.bold20Primary.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColorLight)),
                ])),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
