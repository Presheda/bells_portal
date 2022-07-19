class CourseRegData {
  String courseTitle;
  String courseCode;
  String courseStatus;

  String courseUnit;

  String department;
  String college;
  String level;

  CourseRegData(
      {this.courseTitle,
      this.courseCode,
      this.courseStatus,
      this.courseUnit,
      this.department,
      this.college,
      this.level});

  Map<String, dynamic> toMap() {
    return {
      'courseTitle': this.courseTitle,
      'courseCode': this.courseCode,
      'courseStatus': this.courseStatus,
      'courseUnit': this.courseUnit,
      'department': this.department,
      'college': this.college,
      'level': this.level,
    };
  }

  factory CourseRegData.fromMap(Map<String, dynamic> map) {
    return CourseRegData(
      courseTitle: map['courseTitle'] as String,
      courseCode: map['courseCode'] as String,
      courseStatus: map['courseStatus'] as String,
      courseUnit: map['courseUnit'] as String,
      department: map['department'] as String,
      college: map['college'] as String,
      level: map['level'] as String,
    );
  }
}
