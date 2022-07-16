import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/utils/constant_string.dart';
import 'package:bells_portal/utils/locator.dart';
import 'package:bells_portal/utils/route/route_names.dart';
import 'package:bells_portal/utils/validator.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'check_email_screen.dart';

class ForgotPasswordController extends GetxController {
  AuthService _authService = locator<AuthService>();

  DNavigationService _navigationService = locator<DNavigationService>();

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();




  bool isConnected = true;

  StreamSubscription<ConnectivityResult> _streamSubscription;


  final formKey = GlobalKey<FormState>();


  @override
  void onClose() {
    _streamSubscription?.cancel();
    emailController.dispose();
    super.onClose();
  }

  Future<bool> checkConnection() async {


    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  void listenConnection() async {
    isConnected = await checkConnection();
    _streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      isConnected = event != ConnectivityResult.none;
    });
  }



  void forgotPasswordClicked() async {



    if(!formKey.currentState.validate()) return;

    String email = emailController.text;

    if (!Validators.validateEmail(email)) {
  CustomSnackBar.errorSnackBar(title: "please enter a valid email");
      return;
    }

    emailFocus.unfocus();

    if (!isConnected) {
      CustomSnackBar.errorSnackBar(title: "No network connection");
      return;
    }

    loadDialog(title: "Please Hold on", dismiss: false);

    var data = await _authService.passwordReset(
      email: email,
    );

    Get.back();
    if (data != AuthResultStatus.successful) {
      CustomSnackBar.errorSnackBar(title: data);

      return;
    }

    ///Goes to new screen
    String _title = "Check your mail";
    String _message =
        "We have sent you password reset instructions (also check the Spam folder).";
    Get.to(
        CheckEmailScreen(
          title: _title,
          message: _message,
        ),
        fullscreenDialog: true,
        transition: Transition.rightToLeft);
  }

  void goToSignUp() {

    _navigationService.offAndToNamed(name: RouteName.register);
  }

  void loginClicked() {


    _navigationService.offAndToNamed(name: RouteName.login);
  }

}
