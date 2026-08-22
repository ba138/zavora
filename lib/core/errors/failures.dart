abstract class Failure {
  const Failure(this.message);

  final String message;

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server failure']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache failure']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network failure']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failure']);
}
