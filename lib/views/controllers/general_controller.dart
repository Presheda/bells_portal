import 'dart:async';

import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/utils/utils_export.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  AuthService _authService = locator<AuthService>();
  UserDataService _userDataService = locator<UserDataService>();
  StorageService _storageService = locator<StorageService>();

  DNavigationService _navigationService = locator<DNavigationService>();

  UserData userData;

  ///Auth subscription

  StreamSubscription<bool> _userAuth;
  StreamSubscription<UserData> _userDataSubscription;

  @override
  void onInit() {
    listenForAuth();
    super.onInit();
  }


  @override
  void onClose() {

    _userAuth?.cancel();
    _userDataSubscription?.cancel();
    super.onClose();
  }

  void listenForAuth() {
    _userAuth = _authService.changeUser().listen((event) {
      if (event) return;
      // user is currently not signed in so exit the dashboard screen
      _navigationService.offAllNamedUntil(
        name: RouteName.login,
      );
    });

    _userDataSubscription = _userDataService.listenForChanges().listen((event) {
      userData = event;



      if (userData == null) {
        try {
          _navigationService.offAllNamedUntil(
            name: RouteName.login,
          );
          _authService.signOut();
        } catch (e) {}

        return;
      }

      /// not let's update the settings section


    });
  }
}
