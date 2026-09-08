
import '../../../../../core/error/failure.dart';
import '../../../../../core/result/result.dart';
import '../../domain/entities/signup_user.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_data_source.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource remoteDataSource;

  const SignupRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<SignupUser>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.signup(
        name: name,
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
