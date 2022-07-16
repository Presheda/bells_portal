import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:bells_portal/Services/service_export.dart';


import 'package:bells_portal/widgets/export_widgets.dart';

import 'check_email_screen.dart';

class LoginController extends GetxController {
  AuthService _authService = locator<AuthService>();

  DNavigationService _navigationService = locator<DNavigationService>();

  StorageService _storageService = locator<StorageService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool isConnected = true;

  StreamSubscription<ConnectivityResult> _streamSubscription;

  bool hidePassword = true;


  @override
  void onClose() {
    _streamSubscription?.cancel();

    super.onClose();
  }

  @override
  void onInit() {
    listenConnection();
    super.onInit();
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

  void loginClicked() async {
   // if (!formKey.currentState.validate()) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!Validators.validateEmail(email)) {
      CustomSnackBar.errorSnackBar(title: "please enter a valid email");
      return;
    }

    if (password.trim().length < 6) {
      CustomSnackBar.errorSnackBar(title: "password is too short");
      return;
    }

    emailFocus.unfocus();
    passwordFocus.unfocus();

    if (!isConnected) {
      CustomSnackBar.errorSnackBar(title: "No network connection");
      return;
    }

    loadDialog(title: "Taking you in", dismiss: false);

    var data = await _authService.login(email: email, password: password);

    if (data != AuthResultStatus.successful) {
      Get.back();

      CustomSnackBar.errorSnackBar(title: data);
      return;
    }



    bool isRider = await _authService.isRider();

    if (isRider) {
      _authService.signOut();

      Get.back();

      var dialog = AwesomeDialog(
          context: Get.overlayContext,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.SCALE,
          dismissOnBackKeyPress: true,
          dismissOnTouchOutside: false,
          btnOkOnPress: () {},
          onDissmissCallback: () {},
          title: "Verification Failed",
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          desc: "We identified this account to be a driver ");

      dialog.show();

      return;
    }

    bool complete = await _storageService.isProfileCompleted();

    if (!complete) {
      _navigationService.offAllNamedUntil(name: RouteName.profile_screen);
      return;
    }

    _navigationService.offAllNamedUntil(name: RouteName.user_dashboard);
  }

  void goToForgotPassword() {
    _navigationService.offAndToNamed(name: RouteName.recover_password);
  }

  void goToSignUp() {
    _navigationService.offAndToNamed(name: RouteName.register);
  }

  void togglePassword() {
    hidePassword = !hidePassword;
    update();
  }
}
