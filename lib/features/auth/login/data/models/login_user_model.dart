import '../../domain/entities/login_user.dart';

class LoginUserModel {
  final String id;
  final String name;
  final String email;
  final String token;

  const LoginUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }

  LoginUser toEntity() {
    return LoginUser(
      id: id,
      name: name,
      email: email,
      token: token,
    );
  }
}
