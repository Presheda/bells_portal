import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {},
                        icon: Icon(Icons.info_outline))
                  ],
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomHeaderText(
                            title: "Recover Account",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            maxLine: 2,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomHeaderText(
                            title: "Let us help you get back in",
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).textTheme.bodyText1.color,
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
                                  focus: model.matricFocus,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (matric) {
                                    if (!Validators.validateMatric(matric)) {
                                      return "Invalid Matric!!";
                                    }

                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InfoWidget(
                            title:
                                "Kindly note that an email will be sent your registered email address",
                            icon: Icons.info_outline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GradientButton(
                            title: "Recover",
                            onTap: model.forgotPasswordClicked,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: model.loginClicked,
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
                                    title: "Remember password?",
                                    fontSize: 14,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    title: "Login instead",
                                    fontSize: 14,
                                    color: Color(0xff4092D6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Column(
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
                                    color: Color(0xff4092D6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ])),
                  ),
                )
              ],
            ),
          );
        });
  }
}
