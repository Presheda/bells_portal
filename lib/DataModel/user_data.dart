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



   UserData({
      this.firstName,
      this.lastName,
      this.uid,
      this.email,
      this.location,
      this.phone,
      this.token,
      this.department,
       this.program,
      this.matric,
      this.level});

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
    );
  }
}