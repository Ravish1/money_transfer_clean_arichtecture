
import '../../../../../core/result/result.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/login_user.dart';
import '../repositories/login_repository.dart';

class Login implements UseCase<LoginUser, LoginParams> {
  final LoginRepository repository;

  const Login(this.repository);

  @override
  Future<Result<LoginUser>> call(LoginParams params) {
    return repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });
}
