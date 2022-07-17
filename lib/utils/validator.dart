class Validators {
  final phoneNumberRegExp = RegExp(
      r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');
  static var _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  static bool validateEmail(String value) {
    if (!_emailRegExp.hasMatch(value.trim())) {
      return false;
    }
    return true;
  }

  static bool validateMatric(String value) {
    if (value == null) return false;

    var result = value.split("/");

    if (result.length != 2) return false;

    String firstPart = result[0];
    String secondPart = result[1];

    if (firstPart.length != 4) return false;
    if (secondPart.length != 4) return false;

    int i = int.tryParse(firstPart);
    int o = int.tryParse(secondPart);

    if (i == null || o == null) return false;

    return true;
  }

  String validatePhoneNumber(String value) {
    if (!phoneNumberRegExp.hasMatch(value.trim())) {
      return 'invalid phonenumber';
    }
    return null;
  }
}
