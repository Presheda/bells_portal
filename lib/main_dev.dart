import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';
//import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'utils/utils_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));


  await Firebase.initializeApp();

  setupServices();

  listenForFirebaseNotification();

  registerOneSignal();
 // await initializeLocalNotifications();

  await didNotificationLaunchApp();

  FirebaseFunctions.instance.useFunctionsEmulator("localhost", 5001);

  FirebaseAuth.instance.useAuthEmulator("localhost", 9099);


  String host = defaultTargetPlatform == TargetPlatform.android
      ? '10.0.2.2:8080'
      : 'localhost:8080';

  FirebaseFirestore.instance.settings = Settings(host: host, sslEnabled: false);



  Wakelock.enable();






  runApp(
    DeggiaApp(),
  );




}

class DeggiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash_screen,
      onReady: (){
        didNotificationLaunchApp();
      },
      getPages: RouteName.getPages(),
      defaultTransition: Transition.rightToLeft,
      darkTheme: DeggiaDarkTheme.appDarkTheme(),
      theme: DeggiaLightTheme.appLightTheme(),
      //onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}

