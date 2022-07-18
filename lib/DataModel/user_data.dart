class UserData {
  String firstName;
  String lastName;
  String uid;
  String email;
  String location;
  String phone;
  String token;
  String department;
  String program;
  String matric;
  String level;

  String gender;
  String maritalStatus;
  String religion;
  String genotype;
  String bloodGroup;

  String lga;
  String state;
  String nationality;
  String contactAddress;
  String college;
  String admissionMode;
  String admissionLevel;
  String admissionYear;

  UserData(
      {this.firstName,
      this.lastName,
      this.uid,
      this.email,
      this.location,
      this.phone,
      this.token,
      this.department,
      this.program,
      this.matric,
      this.level,
      this.gender,
      this.maritalStatus,
      this.religion,
      this.genotype,
      this.bloodGroup,
      this.lga,
      this.state,
      this.nationality,
      this.contactAddress,
      this.college,
      this.admissionMode,
      this.admissionLevel,
      this.admissionYear});

  Map<String, dynamic> toMap() {
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'uid': this.uid,
      'email': this.email,
      'location': this.location,
      'phone': this.phone,
      'token': this.token,
      'department': this.department,
      'program': this.program,
      'matric': this.matric,
      'level': this.level,
      'gender': this.gender,
      'maritalStatus': this.maritalStatus,
      'religion': this.religion,
      'genotype': this.genotype,
      'bloodGroup': this.bloodGroup,
      'lga': this.lga,
      'state': this.state,
      'nationality': this.nationality,
      'contactAddress': this.contactAddress,
      'college': this.college,
      'admissionMode': this.admissionMode,
      'admissionLevel': this.admissionLevel,
      'admissionYear': this.admissionYear,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      location: map['location'] as String,
      phone: map['phone'] as String,
      token: map['token'] as String,
      department: map['department'] as String,
      program: map['program'] as String,
      matric: map['matric'] as String,
      level: map['level'] as String,
      gender: map['gender'] as String,
      maritalStatus: map['maritalStatus'] as String,
      religion: map['religion'] as String,
      genotype: map['genotype'] as String,
      bloodGroup: map['bloodGroup'] as String,
      lga: map['lga'] as String,
      state: map['state'] as String,
      nationality: map['nationality'] as String,
      contactAddress: map['contactAddress'] as String,
      college: map['college'] as String,
      admissionMode: map['admissionMode'] as String,
      admissionLevel: map['admissionLevel'] as String,
      admissionYear: map['admissionYear'] as String,
    );
  }
}
