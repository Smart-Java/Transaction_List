import 'package:equatable/equatable.dart';

FailureResponse networkErrorResponse = FailureResponse(
    errorMessage: 'Check your internet connection', statusCode: 0);

FailureResponse errorOccuredResponse =
    FailureResponse(errorMessage: 'An error Occured, try again', statusCode: 1);

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
