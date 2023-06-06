import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FailureResponse extends Equatable {
  int statusCode;
  String errorMessage;
  FailureResponse({
    required this.errorMessage,
    required this.statusCode,
  });
  @override
  List<Object?> get props => [
        statusCode,
        errorMessage,
      ];
}
