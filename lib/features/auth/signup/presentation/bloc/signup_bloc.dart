import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/result/result.dart';
import '../../domain/usecases/signup.dart';
import '../../domain/validators/signup_validator.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final Signup signup;
  final SignupValidator validator;

  SignupBloc({
    required this.signup,
    required this.validator,
  }) : super(const SignupState()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  Future<void> _onSignupSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    final nameFailure = validator.validateName(event.name);

    if (nameFailure != null) {
      emit(SignupState(
        status: SignupStatus.failure,
        errorMessage: nameFailure.message,
      ));
      return;
    }

    final emailFailure = validator.validateEmail(event.email);

    if (emailFailure != null) {
      emit(SignupState(
        status: SignupStatus.failure,
        errorMessage: emailFailure.message,
      ));
      return;
    }

    final passwordFailure = validator.validatePassword(event.password);

    if (passwordFailure != null) {
      emit(SignupState(
        status: SignupStatus.failure,
        errorMessage: passwordFailure.message,
      ));
      return;
    }

    emit(const SignupState(status: SignupStatus.loading));

    final result = await signup(
      SignupParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    switch (result) {
      case Success(data: final user):
        emit(SignupState(
          status: SignupStatus.success,
          user: user,
        ));
      case Error(failure: final failure):
        emit(SignupState(
          status: SignupStatus.failure,
          errorMessage: failure.message,
        ));
    }
  }
}
