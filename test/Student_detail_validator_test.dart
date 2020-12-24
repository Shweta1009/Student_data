import 'package:test/test.dart';
import 'package:student_data/Validator.dart';

void main() {
  group('Counter', () {
    test('Empty  name', () {
      var result = FieldValidator.Validate_name('');
      expect(result, 'Please Enter Name');
    });
    test('Empty School name', () {
      var result = FieldValidator.Validate_schl_name('');
      expect(result, 'Please Enter School Name');
    });
    test('Empty Address', () {
      var result = FieldValidator.Validate_address('');
      expect(result, 'Please Enter address');
    });
    test('Empty number', () {
      var result = FieldValidator.Validate_number('');
      expect(result, 'Please Enter number');
    });
    test('invalid number', () {
      var result = FieldValidator.Validate_number('77984423');
      expect(result, 'Enter valid Phone number');
    });
  });
}
