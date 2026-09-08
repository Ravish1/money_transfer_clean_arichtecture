import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/result/result.dart';
import '../../domain/usecases/login.dart';
import '../../domain/validators/login_validator.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final LoginValidator validator;

  LoginBloc({
    required this.login,
    required this.validator,
  }) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final emailFailure = validator.validateEmail(event.email);

    if (emailFailure != null) {
      emit(LoginState(
        status: LoginStatus.failure,
        errorMessage: emailFailure.message,
      ));
      return;
    }

    final passwordFailure = validator.validatePassword(event.password);

    if (passwordFailure != null) {
      emit(LoginState(
        status: LoginStatus.failure,
        errorMessage: passwordFailure.message,
      ));
      return;
    }

    emit(const LoginState(status: LoginStatus.loading));

    final result = await login(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );

    switch (result) {
      case Success(data: final user):
        emit(LoginState(
          status: LoginStatus.success,
          user: user,
        ));
      case Error(failure: final failure):
        emit(LoginState(
          status: LoginStatus.failure,
          errorMessage: failure.message,
        ));
    }
  }
}
