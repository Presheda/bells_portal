import 'package:bells_portal/DataModel/model_export.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/utils/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CourseHistoryService {
  Stream<List<CourseHistory>> getCourseHistory();
}

class CourseHistoryServiceReal extends CourseHistoryService {
  AuthService _authService = locator<AuthService>();

  @override
  Stream<List<CourseHistory>> getCourseHistory() async* {


    await Future.delayed(Duration(milliseconds: 500));

    yield* FirebaseFirestore.instance
        .collection("users")
        .doc(_authService.currentUserId())
        .collection("course-history")
        .snapshots()
        .map((event) => mapCourseHistory(event.docs));
  }

  List<CourseHistory> mapCourseHistory(List<QueryDocumentSnapshot> docs) {
    List<CourseHistory> course = [];

    if (docs == null) {
      return course;
    }

    docs.forEach((element) {
      course.add(CourseHistory.fromMap(element.data()));
    });

    return course;
  }
}

class CourseHistoryServiceFake extends CourseHistoryService {
  @override
  Stream<List<CourseHistory>> getCourseHistory() async* {
    yield [];
  }
}
