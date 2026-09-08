
import '../../../../../core/error/failure.dart';
import '../../../../../core/result/result.dart';
import '../../domain/entities/login_user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  const LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<LoginUser>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.login(
        email: email,
        password: password,
      );

      return Success(model.toEntity());
    } on Failure catch (failure) {
      return Error(failure);
    } catch (_) {
      return const Error(
        UnexpectedFailure('Something went wrong. Please try again.'),
      );
    }
  }
}
