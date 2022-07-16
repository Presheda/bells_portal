import 'package:wakelock/wakelock.dart';

import 'utils/utils_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  await Firebase.initializeApp();

  setupServices();



  listenForFirebaseNotification();


  registerOneSignal();

  await initializeLocalNotifications();


  await didNotificationLaunchApp();

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
      darkTheme: DeggiaDarkTheme.appDarkTheme(),
      theme: DeggiaLightTheme.appLightTheme(),
      //onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
