import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (model) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: Text(
                      "Bells Portal",
                      style: GoogleFonts.bangers(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff141414)),
                    ),
                    centerTitle: true,

                    expandedHeight: 100,
                    collapsedHeight: 100,
                    pinned: false,

                    actions: [
                      IconButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20
                        ),
                          onPressed: () {}, icon: Icon(Icons.info_outline))
                    ],
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                        delegate: SliverChildListDelegate(([
                      SizedBox(
                        height: 14,
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
                            controller: model.matricController,
                            focus: model.matricFocus,
                            onChanged: (e) {
                              model.update();
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (matric) {
                              if (!Validators.validateMatric(matric)) {
                                return "Invalid Matric";
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

                          SizedBox(
                            height: 60,
                          ),

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

                          SizedBox(
                            height: 60,
                          ),
                    ]))),
                  )
                ],
              ));
        });
  }
}
