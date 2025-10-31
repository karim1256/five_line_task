
abstract class AuthFailure {
  const AuthFailure();
}

class ServerFailure extends AuthFailure {
  final String message;
  const ServerFailure(this.message);
}

class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure();
}

class InvalidEmailFailure extends AuthFailure {
  const InvalidEmailFailure();
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure();
}

class WrongPasswordFailure extends AuthFailure {
  const WrongPasswordFailure();
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure();
}

class UserDisabledFailure extends AuthFailure {
  const UserDisabledFailure();
}

class TooManyRequestsFailure extends AuthFailure {
  const TooManyRequestsFailure();
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure();
}

class UnexpectedFailure extends AuthFailure {
  final String message;
  const UnexpectedFailure(this.message);
}