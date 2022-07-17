class TempData {

  String matric;
  String email;

  TempData({this.matric, this.email});

  Map<String, dynamic> toMap() {
    return {
      'matric': this.matric,
      'email': this.email,
    };
  }

  factory TempData.fromMap(Map<String, dynamic> map) {
    return TempData(
      matric: map['matric'] as String,
      email: map['email'] as String,
    );
  }
}