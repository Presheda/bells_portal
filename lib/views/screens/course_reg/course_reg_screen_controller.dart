import 'package:bells_portal/Services/dNavigationService.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class CourseRegScreenController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();

  List<String> sessionList = ["2021/2022", "2022/2023"];
  List<String> semesterList = ["First semester", "Second semester"];

  String selectedSession = "Select session";

  String selectedSemester = "Select semester";

  @override
  void onInit() {
    // selectedSession = sessionList[0];
    super.onInit();
  }

  sessionSelected({String name}) {
    selectedSession = name;

    update();
  }

  semesterSelected({String name}) {
    selectedSemester = name;

    update();
  }

  bool isSessionSelected() {
    return selectedSession.toLowerCase() != "selected session";
  }

  bool isSemesterSelected() {
    return selectedSemester.toLowerCase() != "selected semester";
  }

  getInfoTitle() {
    return "You are to select an available session as appropriate. Please register early before closing date.";
  }

  proceedTaped() {
    _navigationService.goToNamed(name: RouteName.course_list_screen);
  }
}
