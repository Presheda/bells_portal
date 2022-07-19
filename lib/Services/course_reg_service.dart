import 'package:bells_portal/DataModel/course_reg_data.dart';

abstract class CourseRegService {
  Stream<List<CourseRegData>> getCourseData(
      {String college, String department, String level});
}

class CourseRegServiceReal extends CourseRegService {
  @override
  Stream<List<CourseRegData>> getCourseData(
      {String college, String department, String level}) async* {
    yield [];
  }
}


class CourseRegServiceFake extends CourseRegService {
  @override
  Stream<List<CourseRegData>> getCourseData(
      {String college, String department, String level}) async* {
    yield [];
  }
}
