import 'dart:async';

import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/views/controllers/general_controller.dart';
import 'package:bells_portal/views/screens/course_reg/course_reg_controller.dart';
import 'package:bells_portal/views/screens/home/home_page_controller.dart';
import 'package:bells_portal/views/screens/profile/profile_page_controller.dart';


import 'package:bells_portal/widgets/export_widgets.dart';




class UserDashboardController extends GetxController  {


  int currentIndex = 0;

  CloudFunctionService _cloudFunctionService = locator<CloudFunctionService>();
  UserDataService _userDataService = locator<UserDataService>();
  DNavigationService _navigationService = locator<DNavigationService>();

  AppLifecycleState state;



  @override
  void onClose() {
    cancelSub();

    super.onClose();
  }

  void cancelSub() {

  }

  @override
  void onInit() {
  //  Get.put(GeneralController());
    Get.put(HomePageController());
    Get.put(ProfilePageController());
    Get.put(CourseRegController());



    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

  }




  void bItemTapped(int index) {
    currentIndex = index;

    update();
  }




  void leadingTap() {}

  String getTitle() {
    String title = "";

    switch (currentIndex) {
      case 1:
        title = "Home";
        break;

      case 2:
        title = "Wallet";
        break;

      case 3:
        title = "History";
        break;

      case 4:
        title = "Settings";
        break;

      default:
        title = "Home";
    }

    return title;
  }

  void updateLocation() {
    print("Please update location");
  }

  void updateUserData({UserData userData}) {
    _userDataService.saveUserData(data: userData);
  }

  void updateScreenIndex({int index, bool homePage, String title}) async {
    currentIndex = index;
    update();


    await Future.delayed(Duration(milliseconds: 200));

    if (homePage == null || !homePage) {
      return;
    }

    _navigationService.offUntil();

    await Future.delayed(Duration(milliseconds: 500));

    if (title != null) {
      CustomSnackBar.topSuccessSnackBar(title: title);
    }
  }














}

enum DashboardMenu { home, cart, wallet, orders, profile }
