import 'package:test/test.dart';
import 'package:student_data/Validator.dart';

void main() {
  test('Empty name test', () {
    var result = FieldValidator.Validate_name('');
    expect(result, 'Enter Name');
  });
}
