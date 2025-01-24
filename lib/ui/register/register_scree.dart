import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/model/User_model.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/ui/register/register_navigator.dart';
import 'package:event_planning_ass/ui/register/register_view_model.dart';
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

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterOrLoginNavigator {
  RegisterViewModel registerViewModel = RegisterViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerViewModel.registerNavigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => registerViewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: registerViewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(height: height * 0.3, AssetManager.logoLoginImage),
                CustomTextField(
                  controller: registerViewModel.nameController,
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
                  controller: registerViewModel.emailController,
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
                  controller: registerViewModel.passwordController,
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
                  controller: registerViewModel.rePasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "this filled is required";
                    }
                    if (value != registerViewModel.passwordController.text) {
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
                    registerViewModel.register(context);
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
                        style: AppStyle.Medium16White.copyWith(
                            color: Colors.black)),
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
      ),
    );
  }

  @override
  void hide() {
    // TODO: implement hide
    DailogUtilis.hideLoading(context: context);
  }

  @override
  void showLoading(String message) {
    // TODO: implement showLoading
    DailogUtilis.showLoading(context: context, message: message);
  }

  @override
  void showMessage(String message, void function()) {
    // TODO: implement showMessage
    DailogUtilis.showMessage(
        context: context,
        message: message,
        title: "Register",
        postActionname: "Ok",
        postActionFunc: () {
          function();
        });
  }

  @override
  void navigateToScreen() {
    // TODO: implement navigateToScreen
  }
}
