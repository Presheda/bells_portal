import 'dart:convert';
import 'dart:io';

import 'package:bells_portal/Services/service_export.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wakelock/wakelock.dart';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

var locator = GetIt.instance;

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// set notification Id, the reason for this is we
/// might need to be cancelling some notification

// for incoming call
const int INCOMING_CALL_NOTIFICATION_ID = 100;

// for missed call
const int MISSED_CALL_NOTIFICATION_ID = 101;

// for data notification
const int DATA_NOTIFICATION_ID = 102;

// for other notification
const int OTHER_NOTIFICATION_ID = 103;

const int CALL_TIME_OUT = 30000;

void setupServices() {
  // locator.registerSingleton<DrinkService>( DrinkServiceImpl());

  locator.registerFactory<StorageService>(() => StorageServiceReal());
  locator.registerLazySingleton<AuthService>(() => AuthServiceReal());
  locator.registerLazySingleton<CloudFunctionService>(
      () => CloudFunctionServiceReal());

  locator.registerFactory<DNavigationService>(() => DNavigationServiceReal());
  locator.registerFactory<UserDataService>(() => UserDataServiceFake());
  locator.registerFactory<GenerateDocumentID>(() => GenerateDocumentIDReal());
  locator.registerFactory<GeneralRefService>(() => GeneralRefServiceReal());
  locator.registerFactory<CourseRegService>(() => CourseRegServiceReal());
}

void setupFakeServices() {
  // locator.registerSingleton<DrinkService>( DrinkServiceImpl());

  locator.registerFactory<StorageService>(() => StorageServiceFake());
  locator.registerFactory<UserDataService>(() => UserDataServiceFake());
  locator.registerLazySingleton<AuthService>(() => AuthServiceReal());

  locator.registerFactory<DNavigationService>(() => DNavigationServiceReal());
  locator.registerFactory<GeneralRefService>(() => GeneralRefServiceFake());
}

void listenForFirebaseNotification() {
  /// background message
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  /// while the app is in the foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    if (remoteMessage.notification != null) {
      /// it has notification

      showNotification(
          title: remoteMessage.notification.title,
          message: remoteMessage.notification.body,
          call: false);

      /// to reduce overhead, a message should not contain both a notification and a data field
      ///  one of either notification or data field must be null
      return;
    }
  });
}

Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  print("Handling a background message:::");

  /// since the app automatically handle all messages with
  /// notification, we are just gonna return if there's
  /// notification
  if (remoteMessage.notification != null) {
    showNotification(
        title: remoteMessage.notification.title,
        message: remoteMessage.notification.body,
        call: false);

    /// to reduce overhead, a message should not contain both a notification and a data field
    ///  one of either notification or data field must be null
    return;
  }
}

void showNotification(
    {String title,
    String message,
    Map<String, dynamic> payload,
    bool call = false,
    bool missedCall = false}) async {
  /**
   * So we want to show notification but don't know what type to show
   * If  it's an incoming call set the fullScreenIntent to enable
   * callScreen to kickOff
   *
   * But if it's normal notification then just ignore the fullScreenIntent and
   * display a normal notification
   */

  IOSNotificationDetails iosNotificationDetailsCalls = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: !missedCall,
  );

  IOSNotificationDetails iosNotificationDetailsOrder = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: false,
  );

  AndroidNotificationDetails orderNotificationsSpecific =
      AndroidNotificationDetails('order_status_call', "Order Status",
          channelDescription:
              "This channel is used to provide you with the status of your order",
          importance: Importance.max,
          priority: Priority.high,
          enableLights: true,
          enableVibration: true,
          fullScreenIntent: false,
          channelAction: AndroidNotificationChannelAction.createIfNotExists,
          showWhen: true);

  AndroidNotificationDetails callsNotificationsSpecific =
      AndroidNotificationDetails(
    'calls_channels',
    "app calls channel",
    channelDescription:
        "This channels is used to notify the app of incoming calls",
    importance: Importance.max,
    priority: Priority.high,
    enableLights: true,
    enableVibration: true,
    fullScreenIntent: !missedCall,
    autoCancel: !missedCall,
    channelAction: AndroidNotificationChannelAction.createIfNotExists,
    category: "call",
    ongoing: false,
    showWhen: missedCall,
    when: missedCall ? payload['time'] : null,
    timeoutAfter: CALL_TIME_OUT,
  );

  /**
   * Apply the specifics of the logic
   *
   * So we want to show notification but don't know what type to show
   * If  it's an incoming call set the fullScreenIntent to enable
   * callKeep to kickOff
   *
   * But if it's normal notification then just ignore the fullScreenIntent and
   * display a normal notification
   */

  int notificationId = OTHER_NOTIFICATION_ID;

  NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: call != null && call
          ? callsNotificationsSpecific
          : orderNotificationsSpecific,
      iOS: call != null && call
          ? iosNotificationDetailsCalls
          : iosNotificationDetailsOrder);

  await flutterLocalNotificationsPlugin.show(
      notificationId, title, message, platformChannelSpecifics,
      payload: jsonEncode(payload));

  return;
}

Future<void> initializeLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('notification_icon');

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    print("On Select notification has been called");
  });
}

Future onDidReceiveLocalNotification(
    int id, String title, String body, String payload) async {
  print("Did receive notification has been called");
}

Future didNotificationLaunchApp() async {
  var result =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  bool value = result.didNotificationLaunchApp;

  if (value == null && !value) {
    Wakelock.disable();
    return;
  }
}

void registerOneSignal() {}

void signalSetup() async {}
