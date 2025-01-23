import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/providers/user_provider.dart';
import 'package:event_planning_ass/ui/home_screen.dart';
import 'package:event_planning_ass/ui/register_scree.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:event_planning_ass/utilis/custom_elevated_button.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:event_planning_ass/utilis/dailog_utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String loginScreenId = "LoginScreen";
  bool obscureText;

  LoginScreen({super.key, this.obscureText = false});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.number,
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
              TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppLocalizations.of(context)!.forget_pass,
                      style: AppStyle.bold14Primary.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColorLight,
                          fontSize: 16),
                    ),
                  )),
              custom_elevated_button(
                onButtonClicked: () async {
                  if (_formKey.currentState!.validate()) {
                    //loading
                    DailogUtilis.showLoading(
                        context: context, message: "Loading..");
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);

                      var user = await FirebaseUtilis.readUserFromFireStore(
                          credential.user?.uid ?? "");

                      if (user == null) {
                        return;
                      }
                      UserProvider userprovider =
                          Provider.of<UserProvider>(context, listen: false);
                      userprovider.updateUser(user);
                      DailogUtilis.hideLoading(context: context);
                      DailogUtilis.showMessage(
                          context: context,
                          message: 'Login sucuessfully ',
                          title: AppLocalizations.of(context)!.login,
                          postActionname: "Ok",
                          postActionFunc: () {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.homeScreenId);
                          });
                    } catch (e) {
                      //hide loading
                      //show message
                      DailogUtilis.hideLoading(context: context);
                      DailogUtilis.showMessage(
                          context: context,
                          message: e.toString(),
                          title: "Error",
                          postActionname: "Ok",
                          postActionFunc: () {
                            Navigator.pop(context);
                          });
                      print(e.toString());
                    }

                    //    Navigator.pushReplacementNamed(   context, HomeScreen.homeScreenId);
                  }
                },
                text: AppLocalizations.of(context)!.login,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.do_not_have_acc,
                      style:
                          AppStyle.Medium16White.copyWith(color: Colors.black)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, RegisterScreen.registerScreenId);
                        },
                      text: AppLocalizations.of(context)!.create_acc,
                      style: AppStyle.bold20Primary.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColorLight)),
                ])),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: AppColors.primaryColorLight,
                      indent: 25,
                      endIndent: 25,
                    ),
                  ),
                  Text(
                    "Or",
                    style: AppStyle.Medium16White.copyWith(
                        color: AppColors.primaryColorLight),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: AppColors.primaryColorLight,
                      indent: 25,
                      endIndent: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              custom_elevated_button(
                onButtonClicked: () {},
                color: Colors.transparent,
                icon: Image.asset("assets/icons/goggleIcon.png"),
                text: AppLocalizations.of(context)!.log_with_google,
                style: AppStyle.Medium20Primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
