sealed class SignupEvent {
  const SignupEvent();
}

final class SignupSubmitted extends SignupEvent {
  final String name;
  final String email;
  final String password;

  const SignupSubmitted({
    required this.name,
    required this.email,
    required this.password,
  });
}
