 class UserData {
   String firstName;
   String lastName;
   String uid;
   String email;
   String location;
   String phone;
   String token;

   UserData({this.firstName, this.lastName, this.uid, this.email, this.location,
      this.phone, this.token});

   Map<String, dynamic> toMap() {
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'uid': this.uid,
      'email': this.email,
      'location': this.location,
      'phone': this.phone,
      'token': this.token,
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
    );
  }
}