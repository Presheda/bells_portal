import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (model) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 20,
                    right: 20,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 116,
                          ),
                          CustomHeaderText(
                            title: "Login Into your account",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            maxLine: 2,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            title: "Welcome back, login to access your record",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            maxLine: 2,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              CustomHeaderText(
                                title: "Matric No :",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                maxLine: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                hint: "Your Matric",
                                controller: model.emailController,
                                focus: model.emailFocus,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (email) {
                                  if (!Validators.validateEmail(email)) {
                                    return "invalid email";
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomHeaderText(
                                title: "Password :",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                maxLine: 2,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  hint: "Your password",
                                  validator: (password) {
                                    if (password.trim().length < 6) {
                                      return "password is too short";
                                    }

                                    return null;
                                  },
                                  controller: model.passwordController,
                                  focus: model.passwordFocus,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscure: model.hidePassword,
                                  maxLines: 1,
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        model.hidePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: model.togglePassword)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              GradientButton(
                                title: "Login",
                                onTap: model.loginClicked,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: model.goToForgotPassword,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  CustomText(
                                    title: "Forgot password?",
                                    fontSize: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    title: "Recover",
                                    fontSize: 14,
                                    color: Color(0xff4092D6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 30,
                    right: 20,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: model.goToSignUp,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  title: "Don't have a portal? ",
                                  fontSize: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  title: "Create an account portal",
                                  fontSize: 14,
                                  color: Color(0xff4092D6),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    )
                )
              ],
            ),
          );
        });
  }
}
