
import '../../../../../core/error/failure.dart';

class SignupValidator {
  const SignupValidator();

  Failure? validateName(String name) {
    final value = name.trim();

    if (value.isEmpty) {
      return const ValidationFailure('Name is required');
    }

    if (value.length < 2) {
      return const ValidationFailure(
        'Name must contain at least 2 characters',
      );
    }

    return null;
  }

  Failure? validateEmail(String email) {
    final value = email.trim();

    if (value.isEmpty) {
      return const ValidationFailure('Email is required');
    }

    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (!regex.hasMatch(value)) {
      return const ValidationFailure('Enter a valid email address');
    }

    return null;
  }

  Failure? validatePassword(String password) {
    if (password.isEmpty) {
      return const ValidationFailure('Password is required');
    }

    if (password.length < 6) {
      return const ValidationFailure(
        'Password must contain at least 6 characters',
      );
    }

    return null;
  }
}
