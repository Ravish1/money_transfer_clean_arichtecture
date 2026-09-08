import '../../../../../core/error/failure.dart';
import '../models/signup_user_model.dart';

abstract interface class SignupRemoteDataSource {
  Future<SignupUserModel> signup({
    required String name,
    required String email,
    required String password,
  });
}

/// Fake remote API. Replace this implementation with Dio/http in production.
class FakeSignupRemoteDataSource implements SignupRemoteDataSource {
  final Set<String> _registeredEmails = {
    'test@example.com',
  };

  int _nextId = 2;

  FakeSignupRemoteDataSource();

  Future<void> _simulateNetwork() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
  }

  @override
  Future<SignupUserModel> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    await _simulateNetwork();

    final normalizedEmail = email.trim().toLowerCase();

    if (_registeredEmails.contains(normalizedEmail)) {
      throw const ServerFailure(
        'An account already exists with this email',
      );
    }

    final id = '${_nextId++}';
    _registeredEmails.add(normalizedEmail);

    return SignupUserModel(
      id: id,
      name: name.trim(),
      email: normalizedEmail,
      token: 'fake-signup-token-$id',
    );
  }
}
