import 'package:equatable/equatable.dart';
import '../../domain/entities/login_user.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginUser? user;
  final String? errorMessage;

  const LoginState({
    this.status = LoginStatus.initial,
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
