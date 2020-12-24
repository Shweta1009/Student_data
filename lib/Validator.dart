class FieldValidator {
  static String Validate_name(String value) {
    if (value.isEmpty) return 'Please Enter Name';
    return null;
  }

  static String Validate_schl_name(String value) {
    if (value.isEmpty) return 'Please Enter School Name';
    return null;
  }

  static String Validate_Class(String value) {
    if (value.isEmpty) return 'Please select class';
    return null;
  }

  static String Validate_address(String value) {
    if (value.isEmpty) return 'Please Enter address';
    return null;
  }

  static String Validate_number(String value) {
    if (value.isEmpty) return 'Please Enter number';
    Pattern pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter valid Phone number';
    }
    return null;
  }
}
