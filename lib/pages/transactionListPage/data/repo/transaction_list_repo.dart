import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:transactions_list/dioClient/connectivityManager/model/connection.dart';
import 'package:transactions_list/pages/transactionListPage/data/dataProvider/transaction_list_data.dart';
import 'package:transactions_list/pages/transactionListPage/data/model/transaction_list_model.dart';
import 'package:transactions_list/pages/transactionListPage/data/repo/repoInterface/transaction_list_repo_interface.dart';
import 'package:transactions_list/util/failureResponse/failure_response.dart';

@Injectable(as: TransactionListRepoInterface)
class TransactionListRepo implements TransactionListRepoInterface {
  final TransactionListData transactionListData;
  final Connection connection;
  TransactionListRepo(
    this.transactionListData,
    this.connection,
  );

  @override
  Future<Either<FailureResponse, List<TransactionListModel>>>
      getAllTransactionsRepoRequest() async {
    final checkConnection = await connection.isInternetEnabled();
    Either<FailureResponse, List> data;
    if (checkConnection) {
      data = await transactionListData
          .responseFromGetTxnsRequest()
          .onError((error, stackTrace) {
        return Left(errorOccuredResponse);
      });
      if (data.isRight) {
        var responseData = data.right;
        List<TransactionListModel> txnListModel =
            List<TransactionListModel>.from(responseData
                .map((value) => TransactionListModel.fromMap(value))).toList();
        return Right(txnListModel);
      } else {
        var responseData = data.left;
        return Left(responseData);
      }
    } else {
      return Left(networkErrorResponse);
    }
  }
}
