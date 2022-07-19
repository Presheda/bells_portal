import 'package:bells_portal/views/screens/export_screens.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:get/get.dart';


class RouteName {
  static const String login = "login_page";
  static const String register = "register_page";
  static const String recover_password = "recover_password";

  static const String homepage = 'homepage_page';
  static const String user_dashboard = "user_dashboard_page";

  static const String on_boarding = "/on_boarding_page";

  static const String splash_screen = "splash_screen_page";


  static const String profile_screen = "/profile_screen";
  static const String account_screen = "/account_screen";
  static const String course_reg_screen = "/course_reg_screen";
  static const String course_list_screen = "/course_list_screen";


  //then
  static List<GetPage> getPages() {
    var pages = [
      GetPage(
        name: splash_screen,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: splash_screen,
        ),
        page: () => SplashScreen(),
      ),
      GetPage(
        name: on_boarding,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: on_boarding,
        ),
        page: () => OnBoardingScreen(),
      ),



      GetPage(
        name: login,
        fullscreenDialog: false,
        transition: Transition.rightToLeft,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: recover_password,
        fullscreenDialog: false,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: recover_password,
        ),
        page: () => ForgotPasswordScreen(),
      ),
      GetPage(
        name: register,
        fullscreenDialog: false,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: register,
        ),
        page: () => RegisterScreen(),
      ),

      GetPage(
        name: user_dashboard,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: user_dashboard,
        ),
        page: () => UserDashboardScreen(),
      ),

      GetPage(
        name: user_dashboard,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: user_dashboard,
        ),
        page: () => UserDashboardScreen(),
      ),


  GetPage(
        name: course_reg_screen,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: course_reg_screen,
        ),
        page: () => CourseRegScreen(),
      ),

      GetPage(
        name: course_list_screen,
        transition: Transition.rightToLeft,
        settings: RouteSettings(
          name: course_list_screen,
        ),
        page: () => CourseListScreen(),
      ),



    ];

    return pages;
  }
}
