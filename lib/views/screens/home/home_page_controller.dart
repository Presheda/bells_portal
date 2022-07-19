import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/dNavigationService.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class HomePageController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();

  var userData = UserData(
      matric: "2017/5746",
      firstName: "Afonja",
      lastName: "Adedoyinmola",
      program: "Computer Science",
      department: "Computer Science And IT",
      email: "sapachoke@gmail.com",
      uid: "hduwdhwgdwdwdw",
      phone: "08183698193",
      level: "200");

  getTimeOfDay() {
    return "Good evening";
  }

  getUserName() {
    return "Afonja Doyinmola";
  }

  financialWidgetTap() {
      print("After my life");

    _navigationService.goToNamed(name: RouteName.payment_screen);
  }

  String getCurrentSession() {
    return "2021/2022";
  }

  String getCourseRegStatus() {
    return "Closed";
  }

  String getCurrentSemester() {
    return "Second";
  }

  String getStudentCourseRegStatus() {
    return "Completed";
  }

  void sessionTap() {

    _openSessionBtm();
  }

  void semesterTap() {

    _openSessionBtm();

  }

  _openSessionBtm(){
    Get.bottomSheet(
        SessionInformation(
          tuitionStatus: "Completed",
          registrationStatus: "Completed",
          currentSemester: "Second",
          currentSession: "2021/2022",
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        isScrollControlled: false
    );
  }
}
