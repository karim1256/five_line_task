abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure();
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure();
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure();
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure();
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure();
}

class UserDisabledFailure extends Failure {
  const UserDisabledFailure();
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure();
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class UnexpectedFailure extends Failure {
  final String message;
  const UnexpectedFailure(this.message);
}
