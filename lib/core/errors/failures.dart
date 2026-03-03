import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final int? code;

  const Failure({this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.code});
}

class LocalFailure extends Failure {
  const LocalFailure({super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super(message: "Unauthorized");
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super(message: "Request timeout");
}
