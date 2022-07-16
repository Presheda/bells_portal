import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forgot_password_controller.dart';
import 'login_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (model) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: ScaffoldBackground(
              child: Stack(
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
                              title: "Oops!",
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              maxLine: 2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomHeaderText(
                              title: "Recover password",
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              maxLine: 2,
                            ),
                            Form(
                              key: model.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CustomTextField(
                                    hint: "Matric",
                                    controller: model.matricController,
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

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: model.loginClicked,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                                      title: "Remember password?",
                                      fontSize: 14,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CustomText(
                                      title: "Sign in instead",
                                      fontSize: 14,
                                      color: Color(0xffC09F3F),
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
                                    title: "Don't have an account?",
                                    fontSize: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    title: "Sign up",
                                    fontSize: 14,
                                    color: Color(0xffC09F3F),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GradientButton(
                            title: "Recover",
                            onTap: model.forgotPasswordClicked,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
