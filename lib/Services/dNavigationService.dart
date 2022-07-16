
import 'package:bells_portal/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

abstract class DNavigationService {
  Future<dynamic> goToNamed(
      {@required String name, var data, var mixpanelEventData});


  Future<void> until ({String name});

  Future<dynamic> offAndToNamed(
      {String name, dynamic data, var mixpanelEventData});

  Future<dynamic> offUntil({String name, dynamic data, var mixpanelEventData});

  Future<dynamic> offAndToWidget(
      {var widget, dynamic data, var mixpanelEventData});

  Future<dynamic> offAllNamedUntil(
      {String name, String until, dynamic data, var mixpanelEventData});

  Future<dynamic> openBottomSheet(
      {var child, var data, bool isScrollContinued, var mixpanelEventData});

  Future<dynamic> openCustomBottomSheet(
      {var child, var data, bool isScrollContinued, var mixpanelEventData});

  Future<dynamic> back();
}

class DNavigationServiceFake extends DNavigationService {
  @override
  Future back() {}

  @override
  Future goToNamed(
      {String name, data, String mixpanelEventName, mixpanelEventData}) {}

  @override
  Future offAndToNamed(
      {String name, data, String mixpanelEventName, mixpanelEventData}) {}

  @override
  Future openBottomSheet(
      {child, var data, bool isScrollContinued, mixpanelEventData}) {}

  @override
  Future offAllNamedUntil(
      {String name, String until, data, mixpanelEventData}) {}

  @override
  Future offAndToWidget({widget, data, mixpanelEventData}) {}

  @override
  Future offUntil({String name, data, mixpanelEventData}) {}

  @override
  Future openCustomBottomSheet(
      {child, data, bool isScrollContinued, mixpanelEventData}) {}

  @override
  Future<void> until({String name}) {

  }
}

class DNavigationServiceReal extends DNavigationService {

  @override
  Future back() {}

  @override
  Future goToNamed({String name, var data, var mixpanelEventData}) {




    return Get.toNamed(name, arguments: data);
  }

  @override
  Future offAndToNamed({String name, data, var mixpanelEventData}) async {


    Get.offAndToNamed(name, arguments: data);
  }

  @override
  Future openBottomSheet(
      {child, bool isScrollContinued, var data, mixpanelEventData}) {
    Get.bottomSheet(child,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        isScrollControlled: isScrollContinued ?? false,
        settings: RouteSettings(
          arguments: data,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))));
  }

  @override
  Future offAllNamedUntil(
      {String name, String until, data, mixpanelEventData}) {


    if (until == null) until = "";

    return Get.offNamedUntil(
        name,
        (route) =>
            route.settings.name != null &&
            route.settings.name.toLowerCase() == until.toLowerCase(),
        arguments: data);
  }

  @override
  Future until(
      {String name,  mixpanelEventData}) {



    Get.until((route) => Get.currentRoute == name );



  }


  @override
  Future offAndToWidget({widget, data, mixpanelEventData}) {
    String name;

    try {
      name = widget.toString();
    } catch (e) {}


    Get.off(widget, arguments: data);
  }

  @override
  Future offUntil({String name, data, mixpanelEventData}) {
    if (name == null || name.isEmpty) name = RouteName.user_dashboard;

    Get.until((route) => route.settings.name == name);
  }

  @override
  Future openCustomBottomSheet(
      {child, data, bool isScrollContinued, mixpanelEventData}) {
    showMaterialModalBottomSheet(
        context: Get.overlayContext,
        builder: (context) => child,
        expand: false);
  }
}
