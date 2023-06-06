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
    this.allSearchTxnList,
    this.creditSearchTxnList,
    this.debitSearchTxnList,
    this.isSearchOn,
    this.isThereAnySearchResult,
    this.searchQuery,
  });

  final bool? isLoading;
  final bool? isRequestSuccessful;
  final bool? isSearchOn;
  final bool? isThereAnySearchResult;
  final int? currentTxnTab;
  final List<TransactionListModel>? allTxnList;
  final List<TransactionListModel>? creditTxnList;
  final List<TransactionListModel>? debitTxnList;
  final List<TransactionListModel>? allSearchTxnList;
  final List<TransactionListModel>? creditSearchTxnList;
  final List<TransactionListModel>? debitSearchTxnList;
  final String? requestMessage;
  final String? searchQuery;
  @override
  List<Object?> get props => [
        isLoading,
        requestMessage,
        isRequestSuccessful,
        allTxnList,
        creditTxnList,
        debitTxnList,
        allSearchTxnList,
        creditSearchTxnList,
        debitSearchTxnList,
        currentTxnTab,
        isSearchOn,
        isThereAnySearchResult,
        searchQuery,
      ];

  TransactionsListState copyWith({
    bool? isLoading,
    bool? isRequestSuccessful,
    bool? isSearchOn,
    bool? isThereAnySearchResult,
    required int currentTxnTab,
    List<TransactionListModel>? allTxnList,
    List<TransactionListModel>? creditTxnList,
    List<TransactionListModel>? debitTxnList,
    List<TransactionListModel>? allSearchTxnList,
    List<TransactionListModel>? creditSearchTxnList,
    List<TransactionListModel>? debitSearchTxnList,
    String? requestMessage,
    String? searchQuery,
  }) {
    return TransactionsListState(
      isLoading: isLoading,
      requestMessage: requestMessage,
      isSearchOn: isSearchOn,
      isThereAnySearchResult: isThereAnySearchResult,
      isRequestSuccessful: isRequestSuccessful,
      currentTxnTab: currentTxnTab,
      allTxnList: allTxnList,
      creditTxnList: creditTxnList,
      debitTxnList: debitTxnList,
      allSearchTxnList: allSearchTxnList,
      creditSearchTxnList: creditSearchTxnList,
      debitSearchTxnList: debitSearchTxnList,
      searchQuery: searchQuery,
    );
  }
}
