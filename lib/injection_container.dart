import 'package:get_it/get_it.dart';

import 'features/auth/login/data/datasources/login_remote_data_source.dart';
import 'features/auth/login/data/repositories/login_repository_impl.dart';
import 'features/auth/login/domain/repositories/login_repository.dart';
import 'features/auth/login/domain/usecases/login.dart';
import 'features/auth/login/domain/validators/login_validator.dart';
import 'features/auth/login/presentation/bloc/login_bloc.dart';

import 'features/auth/signup/data/datasources/signup_remote_data_source.dart';
import 'features/auth/signup/data/repositories/signup_repository_impl.dart';
import 'features/auth/signup/domain/repositories/signup_repository.dart';
import 'features/auth/signup/domain/usecases/signup.dart';
import 'features/auth/signup/domain/validators/signup_validator.dart';
import 'features/auth/signup/presentation/bloc/signup_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // LOGIN
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    FakeLoginRemoteDataSource.new,
  );

  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      getIt<LoginRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<Login>(
    () => Login(getIt<LoginRepository>()),
  );

  getIt.registerLazySingleton<LoginValidator>(
    LoginValidator.new,
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      login: getIt<Login>(),
      validator: getIt<LoginValidator>(),
    ),
  );

  // SIGNUP
  getIt.registerLazySingleton<SignupRemoteDataSource>(
    FakeSignupRemoteDataSource.new,
  );

  getIt.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(
      getIt<SignupRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<Signup>(
    () => Signup(getIt<SignupRepository>()),
  );

  getIt.registerLazySingleton<SignupValidator>(
    SignupValidator.new,
  );

  getIt.registerFactory<SignupBloc>(
    () => SignupBloc(
      signup: getIt<Signup>(),
      validator: getIt<SignupValidator>(),
    ),
  );
}
