import 'package:bells_portal/Services/dNavigationService.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class CourseRegPageController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();


  @override
  void onInit() {
   // selectedSession = sessionList[0];
    super.onInit();
  }

  void registerCourseTap() {
    _navigationService.goToNamed(name: RouteName.course_reg_screen);
  }

}
