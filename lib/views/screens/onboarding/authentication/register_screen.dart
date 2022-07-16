
import 'package:bells_portal/views/screens/onboarding/authentication/register_controller.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

import 'package:flutter/services.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (model) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: CustomHeaderText(
                      title: "Register",
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).textTheme.bodyText1.color,
                      maxLine: 2,
                    ),
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
                          hint: "First Name",
                          validator: (name) {
                            if (name.trim().length < 3) {
                              return "First Name is too short";
                            }
                            return null;
                          },
                          controller: model.firstNameController,
                          focus: model.firstNameFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: "Last Name",
                          validator: (name) {
                            if (name.trim().length < 3) {
                              return "Last Name is too short";
                            }
                            return null;
                          },
                          controller: model.lastNameController,
                          focus: model.lastNameFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: "Email address",
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
                        CustomTextField(
                            hint: "Password",
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
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: "Phone number",
                          validator: (name) {
                            if (name.trim().length != 11) {
                              return "Phone number must be 11 digits";
                            }
                            return null;
                          },
                          controller: model.phoneController,
                          focus: model.phoneFocus,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(signed: true),
                          maxLenght: 11,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SelectNameWidget(
                          nameList: model.hardCodedHostel,
                          onTap: model.onHostelSelected,
                          title: model.hostel,
                        ),
                      ],
                    ),
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
                            color: Color(0xffC09F3F),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: model.loginClicked,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                title: "Already have an account?",
                                fontSize: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CustomText(
                                title: "Login Instead",
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
                        title: "Sign Up",
                        onTap: model.registerClicked,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
