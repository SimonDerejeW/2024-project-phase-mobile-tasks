import 'package:equatable/equatable.dart';

abstract class Exception extends Equatable {
  final String message;
  const Exception(this.message);

  @override
  List<Object?> get props => [message];
}

class JsonParsingException extends Exception {
  const JsonParsingException(String message) : super(message);
}
