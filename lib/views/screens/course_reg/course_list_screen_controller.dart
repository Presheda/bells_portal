import 'dart:async';
import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/views/controllers/general_controller.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class CourseListScreenController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();
  CourseRegService _courseService = locator<CourseRegService>();

  CloudFunctionService _cloudFunctionService = locator<CloudFunctionService>();

  StreamSubscription<List<CourseRegData>> _streamSubscription;

  List<CourseRegData> courseRegDataList = [];
  List<CourseRegData> selectedCourse = [];

  DeggiaAppState appState = DeggiaAppState.Loading;

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

      if (courseRegDataList.isEmpty) {
        appState = DeggiaAppState.failed;
      } else {
        appState = DeggiaAppState.Idle;
      }

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

    UserData _userData = Get.find<GeneralController>().userData;

    CourseHistory courseHistory = CourseHistory(
      courses: selectedCourse,
      firstName: _userData.firstName,
      lastName: _userData.lastName,
      matric: _userData.matric,
      level: _userData.level,
      email: _userData.email,
      department: _userData.department,
      program: _userData.program,
      uid: _userData.uid,

      //TODO do forget to add the current session
    );

    await Future.delayed(Duration(milliseconds: 1500));

  var result = await  _cloudFunctionService.callFunction(
        name: BellsPortalCloudFunctionNames.registerCourse,
        data: {
          courseHistory.toMap(),
        });


  if(result == -1){
    /// course registration failed


    _navigationService.back();


    CustomSnackBar.errorSnackBar(title: "Registration Failed");
  }

    _navigationService.offUntil(name: RouteName.user_dashboard);

    CustomSnackBar.successSnackBar(title: "Registration Succeeded");
  }

  reloadCourse() {
    appState = DeggiaAppState.Loading;

    update();

    _streamSubscription?.cancel();

    fetchCourse();
  }

  void historyTap() {
    _navigationService.goToNamed(name: RouteName.course_history_screen);
  }
}
