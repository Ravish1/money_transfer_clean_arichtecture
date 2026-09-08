import 'package:equatable/equatable.dart';
import '../../domain/entities/signup_user.dart';

enum SignupStatus {
  initial,
  loading,
  success,
  failure,
}

class SignupState extends Equatable {
  final SignupStatus status;
  final SignupUser? user;
  final String? errorMessage;

  const SignupState({
    this.status = SignupStatus.initial,
    this.user,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    status,
    user?.id,
    user?.email,
    errorMessage,
  ];
}
