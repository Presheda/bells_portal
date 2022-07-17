import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class HomePageController extends GetxController {
  var userData = UserData(
    matric: "2017/5746",
    firstName: "Afonja",
    lastName: "Adedoyinmola",
    program: "Computer Science",
    department: "Computer Science And IT",
    email: "sapachoke@gmail.com",
    uid: "hduwdhwgdwdwdw",
    phone: "08183698193",
    level: "200"
  );

  getTimeOfDay() {
    return "Good evening";
  }

  getUserName() {
    return "Afonja Doyinmola";
  }

  financialWidgetTap() {}

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
}
