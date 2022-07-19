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
    yield [
      CourseRegData(
          courseCode: "501",
          courseStatus: "R",
          courseTitle: "Computer Programming",
          courseUnit: "2"),
      CourseRegData(
          courseCode: "505",
          courseStatus: "R",
          courseTitle: "Computer Architecture",
          courseUnit: "3"),
      CourseRegData(
          courseCode: "502",
          courseStatus: "R",
          courseTitle: "Database Design",
          courseUnit: "2"),
      CourseRegData(
          courseCode: "507",
          courseStatus: "C",
          courseTitle: "Database Architecture",
          courseUnit: "3"),
    ];
  }
}
