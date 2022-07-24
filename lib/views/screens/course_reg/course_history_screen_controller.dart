import 'dart:async';
import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class CourseHistoryScreenController extends GetxController {
  DNavigationService _navigationService = locator<DNavigationService>();
  CourseHistoryService _courseService = locator<CourseHistoryService>();

  StreamSubscription<List<CourseHistory>> _streamSubscription;

  List<CourseHistory> courseHistory = [];

  DeggiaAppState appState = DeggiaAppState.Loading;

  @override
  void onInit() {
    fetchCourseHistory();
    super.onInit();
  }

  void fetchCourseHistory() {
    _streamSubscription = _courseService.getCourseHistory().listen((event) {
      courseHistory = event ?? [];

      if (courseHistory.isEmpty) {
        appState = DeggiaAppState.EmptyState;
      } else {
        appState = DeggiaAppState.Idle;
      }
      update();
    });
  }

  void selectCourse({CourseHistory courseHistory}) {}
}
