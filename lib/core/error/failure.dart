sealed class Failure {
  final String message;
  const Failure(this.message);
}

final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
