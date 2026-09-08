import 'package:flutter_test/flutter_test.dart';

void main() {
  const validator = AuthValidator();

  test('valid email passes', () {
    expect(validator.validateEmail('test@example.com'), isNull);
  });

  test('invalid email fails', () {
    expect(
      validator.validateEmail('wrong'),
      'Enter a valid email address',
    );
  });

  test('short password fails', () {
    expect(
      validator.validatePassword('123'),
      'Password must contain at least 6 characters',
    );
  });
}
