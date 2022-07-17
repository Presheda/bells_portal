import 'dart:async';

import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/DataModel/user_data.dart';

import 'package:bells_portal/widgets/export_widgets.dart';


class SplashScreenController extends GetxController {
  StorageService storageService = locator<StorageService>();
  DNavigationService _navigationService = locator<DNavigationService>();

  AuthService _authService = locator<AuthService>();
  StreamSubscription<UserData> _streamSubscription;


  bool completeProfile;

  @override
  void onInit() {
    super.onInit();
    fetchLocalProfile();
    fetchData();

    // fetchProfile();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }


  void fetchData() async {
    bool light = await storageService.isLightMode();


    if (light) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    bool isFirstTime = await storageService.firstTime();
    if (isFirstTime) {
      await storageService.setFirstTime();

      await _navigationService.offAndToNamed(
        name: RouteName.login,
      );
      return;
    }

    bool isLoggedIn = _authService.isLoggedIn();

    if (isLoggedIn) {

      // if (!completeProfile) {
      //   //incomplete profile, continue on-boarding
      //
      //   await _navigationService.offAndToNamed(
      //     name: RouteName.profile_screen,
      //   );
      //
      //   return;
      // }

      // profile is completed go to homepage
      await _navigationService.offAndToNamed(
        name: RouteName.user_dashboard,
      );

      return;
    }

    await _navigationService.offAndToNamed(
      name: RouteName.login,
    );
  }

  Future<void> fetchLocalProfile() async {
    completeProfile = await storageService.isProfileCompleted() ?? false;
    return;
  }
}
