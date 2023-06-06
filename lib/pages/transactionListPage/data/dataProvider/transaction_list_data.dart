import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:transactions_list/api/apiEndpoints/api_end_points.dart';
import 'package:transactions_list/api/apiRequestHelper/api_request_helper.dart';
import 'package:transactions_list/util/failureResponse/failure_response.dart';

@injectable
class TransactionListData {
  ApiRequestHelper apiRequestHelper;
  TransactionListData(
    this.apiRequestHelper,
  );

  Future getAllTransactionsRequest() async {
    dynamic transactionsRequestResponse;
    transactionsRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.transactionsEndPoint,
    );
    return transactionsRequestResponse;
  }

  Future<Either<FailureResponse, List>>
      responseFromGetTxnsRequest() async {
    var transactionsRequestResponse = await getAllTransactionsRequest();
    int getStatusCode = transactionsRequestResponse.statusCode;

    switch (getStatusCode) {
      case 200:
        return Right(transactionsRequestResponse.data);
      default:
        FailureResponse failureResponse = FailureResponse(
          errorMessage: transactionsRequestResponse.data ?? 'An error occured',
          statusCode: getStatusCode,
        );
        return Left(failureResponse);
    }
  }
}
