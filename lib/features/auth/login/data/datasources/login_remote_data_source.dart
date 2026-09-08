import '../../../../../core/error/failure.dart';
import '../models/login_user_model.dart';

abstract interface class LoginRemoteDataSource {
  Future<LoginUserModel> login({
    required String email,
    required String password,
  });
}

/// Fake remote API. Replace this implementation with Dio/http in production.
class FakeLoginRemoteDataSource implements LoginRemoteDataSource {
  const FakeLoginRemoteDataSource();

  Future<void> _simulateNetwork() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
  }

  @override
  Future<LoginUserModel> login({
    required String email,
    required String password,
  }) async {
    await _simulateNetwork();

    final normalizedEmail = email.trim().toLowerCase();

    if (normalizedEmail != 'test@example.com') {
      throw const ServerFailure('Account not found');
    }

    if (password != 'password') {
      throw const ServerFailure('Invalid email or password');
    }

    return LoginUserModel(
      id: '1',
      name: 'Test User',
      email: normalizedEmail,
      token: 'fake-login-token-1',
    );
  }
}
