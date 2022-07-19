import 'package:bells_portal/Services/dNavigationService.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class CourseListScreenController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();


  void onInit() {
    // selectedSession = sessionList[0];
    super.onInit();
  }





  getInfoTitle() {
    return "You are to select an available session as appropriate. Please register early before closing date.";
  }
}
