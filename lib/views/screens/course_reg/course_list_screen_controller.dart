import 'dart:async';
import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class CourseListScreenController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();
  CourseRegService _courseService = locator<CourseRegService>();

  StreamSubscription<List<CourseRegData>> _streamSubscription;

  List<CourseRegData> courseRegDataList = [];
  List<CourseRegData> selectedCourse = [];

  void onInit() {
    // selectedSession = sessionList[0];
    super.onInit();

    fetchCourse();
  }

  getInfoTitle() {
    return "You are to select an available session as appropriate. Please register early before closing date.";
  }

  void fetchCourse() {
    _streamSubscription = _courseService.getCourseData().listen((event) {
      courseRegDataList = event ?? [];

      update();
    });
  }

  void selectCourse({CourseRegData courseRegData}) {
    int index = selectedCourse.indexWhere((element) =>
        element.courseCode.toLowerCase() ==
        courseRegData.courseCode.toLowerCase());

    if (index != -1) {
      selectedCourse.removeWhere((element) =>
          element.courseCode.toLowerCase() ==
          courseRegData.courseCode.toLowerCase());
    } else {
      selectedCourse.add(courseRegData);
    }

    update();
  }

  bool isCourseSelected({CourseRegData courseRegData}) {
    int index = selectedCourse.indexWhere((element) =>
        element.courseCode.toLowerCase() ==
        courseRegData.courseCode.toLowerCase());

    return index != -1;
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  proceedToRegister() async {
    if (selectedCourse.isEmpty) {
      CustomSnackBar.errorSnackBar(title: "No Course Selected");
      return;
    }

    loadDialog(title: "Registering Course", dismiss: false);

    await Future.delayed(Duration(milliseconds: 1500));

    _navigationService.offUntil(name: RouteName.user_dashboard);

    CustomSnackBar.successSnackBar(title: "Registration Succeeded");
  }
}
