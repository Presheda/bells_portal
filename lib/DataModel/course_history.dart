import 'package:bells_portal/DataModel/model_export.dart';

class CourseHistory {

  List<CourseRegData> courses;


  /// about the student
  String matric;
  String firstName;
  String lastName;



  /// about the current level and session
  String level;
  String session;


  ///
  String department;
  String program;
  String college;

  String email;
  String uid;


  CourseHistory({
      this.courses,
      this.matric,
      this.firstName,
      this.lastName,
      this.level,
      this.session,
      this.department,
      this.program,
      this.college,
      this.email,
      this.uid});

  Map<String, dynamic> toMap() {
    return {
      'courses': this.courses,
      'matric': this.matric,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'level': this.level,
      'session': this.session,
      'department': this.department,
      'program': this.program,
      'college': this.college,
      'email': this.email,
      'uid': this.uid,
    };
  }

  factory CourseHistory.fromMap(Map<String, dynamic> map) {
    return CourseHistory(
      courses: map['courses'] as List<CourseRegData>,
      matric: map['matric'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      level: map['level'] as String,
      session: map['session'] as String,
      department: map['department'] as String,
      program: map['program'] as String,
      college: map['college'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }
}