import '../../domain/entities/signup_user.dart';

class SignupUserModel {
  final String id;
  final String name;
  final String email;
  final String token;

  const SignupUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory SignupUserModel.fromJson(Map<String, dynamic> json) {
    return SignupUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }

  SignupUser toEntity() {
    return SignupUser(
      id: id,
      name: name,
      email: email,
      token: token,
    );
  }
}
