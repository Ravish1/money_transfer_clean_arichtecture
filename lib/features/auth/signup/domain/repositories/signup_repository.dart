import '../../../../../core/result/result.dart';
import '../entities/signup_user.dart';

abstract interface class SignupRepository {
  Future<Result<SignupUser>> signup({
    required String name,
    required String email,
    required String password,
  });
}
