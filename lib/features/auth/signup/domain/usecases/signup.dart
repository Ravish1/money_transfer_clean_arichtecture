
import '../../../../../core/result/result.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/signup_user.dart';
import '../repositories/signup_repository.dart';

class Signup implements UseCase<SignupUser, SignupParams> {
  final SignupRepository repository;

  const Signup(this.repository);

  @override
  Future<Result<SignupUser>> call(SignupParams params) {
    return repository.signup(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignupParams {
  final String name;
  final String email;
  final String password;

  const SignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
