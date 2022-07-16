import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';

import 'package:bells_portal/widgets/export_widgets.dart';

import 'check_email_screen.dart';

class RegisterController extends GetxController {
  AuthService _authService = locator<AuthService>();
  UserDataService _userDataService = locator<UserDataService>();
  StorageService _storageService = locator<StorageService>();

  DNavigationService _navigationService = locator<DNavigationService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  FocusNode phoneFocus = FocusNode();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  bool isConnected = true;

  bool hidePassword = true;

  StreamSubscription<ConnectivityResult> _streamSubscription;

  List<String> hardCodedHostel = Constant.hardCodedHostel();

  String hostel = "";

  @override
  void onInit() {
    hostel = Constant.hardCodedHostel()[0];
    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();

    emailController.dispose();
    passwordController.dispose();
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

  void registerClicked() async {
    if (!formKey.currentState.validate()) return;

    String email = emailController.text;
    String password = passwordController.text;

    String _firstName = firstNameController.text.trim();
    String _lastName = lastNameController.text.trim();
    String _phone = phoneController.text.trim();

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
    firstNameFocus.unfocus();
    lastNameFocus.unfocus();
    phoneFocus.unfocus();

    if (!isConnected) {
      CustomSnackBar.errorSnackBar(title: "No network connection");
      return;
    }

    loadDialog(title: "Please Hold", dismiss: true);

    var data = await _authService.register(email: email, password: password);

    UserData userData = UserData(
        firstName: _firstName,
        lastName: _lastName,
        phone: _phone,
        email: email,
        location: hostel);

    if (data != AuthResultStatus.successful) {
      CustomSnackBar.errorSnackBar(title: data);

      Get.back();

      return;
    }

    await _userDataService.saveUserData(data: userData);
    _storageService.setIsProfileCompleted(complete: true);



    Get.back();

    _navigationService.offAllNamedUntil(name: RouteName.user_dashboard);

    // await _authService.sendEmailVerification();

    ///Goes to new screen

    // String _title = "Check your mail";
    // String _message =
    //     "We have sent you an account verification link  (also check the Spam folder).";
    //
    // Get.to(CheckEmailScreen(title: _title, message: _message),
    //     fullscreenDialog: true);
  }

  void loginClicked() async {
    _navigationService.offAndToNamed(name: RouteName.login);
  }

  void goToForgotPassword() {
    _navigationService.offAndToNamed(name: RouteName.recover_password);
  }

  void togglePassword() {
    hidePassword = !hidePassword;
    update();
  }

  onHostelSelected({String name}) {
    hostel = name;
    update();
  }
}
