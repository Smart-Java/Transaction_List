import 'package:equatable/equatable.dart';
import 'package:transactions_list/pages/transactionListPage/data/model/transaction_list_model.dart';

class TransactionsListState extends Equatable {
  const TransactionsListState({
    this.currentTxnTab,
    this.isLoading,
    this.isRequestSuccessful,
    this.requestMessage,
    this.allTxnList,
    this.creditTxnList,
    this.debitTxnList,
    this.searchedResultList,
  });

  final bool? isLoading;
  final bool? isRequestSuccessful;
  final int? currentTxnTab;
  final List<TransactionListModel>? allTxnList;
  final List<TransactionListModel>? creditTxnList;
  final List<TransactionListModel>? debitTxnList;
  final List<TransactionListModel>? searchedResultList;
  final String? requestMessage;
  @override
  List<Object?> get props => [
        isLoading,
        requestMessage,
        isRequestSuccessful,
        allTxnList,
        creditTxnList,
        debitTxnList,
        currentTxnTab,
        searchedResultList,
      ];

  TransactionsListState copyWith({
    bool? isLoading,
    bool? isRequestSuccessful,
    required int currentTxnTab,
    List<TransactionListModel>? allTxnList,
    List<TransactionListModel>? creditTxnList,
    List<TransactionListModel>? debitTxnList,
    List<TransactionListModel>? searchedResultList,
    String? requestMessage,
  }) {
    return TransactionsListState(
      isLoading: isLoading,
      requestMessage: requestMessage,
      isRequestSuccessful: isRequestSuccessful,
      currentTxnTab: currentTxnTab,
      allTxnList: allTxnList,
      creditTxnList: creditTxnList,
      debitTxnList: debitTxnList,
      searchedResultList: searchedResultList,
    );
  }
}
