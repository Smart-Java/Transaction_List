import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/event/transaction_list_event.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/state/transaction_list_state.dart';
import 'package:transactions_list/pages/transactionListPage/data/model/transaction_list_model.dart';
import 'package:transactions_list/pages/transactionListPage/data/repo/repoInterface/transaction_list_repo_interface.dart';
import 'package:transactions_list/util/failureResponse/failure_response.dart';

@injectable
class TransactionListBloc
    extends Bloc<TransactionListEvent, TransactionsListState> {
  final TransactionListRepoInterface transactionListRepo;

  List<TransactionListModel> cachedAllTxnList = [];
  List<TransactionListModel> cachedCreditTxnList = [];
  List<TransactionListModel> cachedDebitTxnList = [];

  List<TransactionListModel> cachedSearchedResultTxnList = [];

  int currentIndexTab = 0;

  bool isTxnRequestSuccessful = false;

  TransactionListBloc(
    this.transactionListRepo,
  ) : super(const TransactionsListState(currentTxnTab: 0)) {
    on<GetTransactionListEvent>((event, emit) async {
      currentIndexTab = event.tabIndex;
      cachedAllTxnList.clear();
      cachedCreditTxnList.clear();
      cachedDebitTxnList.clear();
      emit(
        state.copyWith(
          isLoading: true,
          currentTxnTab: currentIndexTab,
        ),
      );
      Either<FailureResponse, List<TransactionListModel>> requestResponse =
          await transactionListRepo.getAllTransactionsRepoRequest();
      if (requestResponse.isRight) {
        cachedAllTxnList = requestResponse.right;
        isTxnRequestSuccessful = true;
        for (var element in cachedAllTxnList) {
          if (element.drCr.toLowerCase() == 'withdrawal') {
            cachedDebitTxnList.add(element);
          } else {
            cachedCreditTxnList.add(element);
          }
        }
        debugPrint(
            'this is all length ${cachedAllTxnList.length} debit length ${cachedDebitTxnList.length} credit length ${cachedCreditTxnList.length}');
        emit(
          state.copyWith(
            isLoading: false,
            isRequestSuccessful: isTxnRequestSuccessful,
            currentTxnTab: currentIndexTab,
            allTxnList: cachedAllTxnList,
            creditTxnList: cachedCreditTxnList,
            debitTxnList: cachedDebitTxnList,
            requestMessage: 'Transaction list retrieve successful',
          ),
        );
      } else {
        isTxnRequestSuccessful = false;
        emit(
          state.copyWith(
            isLoading: false,
            isRequestSuccessful: false,
            currentTxnTab: currentIndexTab,
            allTxnList: cachedAllTxnList,
            creditTxnList: cachedCreditTxnList,
            debitTxnList: cachedDebitTxnList,
            requestMessage: requestResponse.left.errorMessage,
          ),
        );
      }
    });
    on<FilterTxnListEvent>((event, emit) {
      if (event.searchBase.isNotEmpty &&
          event.searchQuery.isNotEmpty &&
          event.searchIndexTab <= 2) {
        String query = event.searchQuery;
        String baseOnTxnField = event.searchBase;
        int indexTab = event.searchIndexTab;

        debugPrint(
            'operation occurring here $query $baseOnTxnField $indexTab');

        List<TransactionListModel> txnSearchList;

        List<TransactionListModel> searchedResultList = [];

        switch (indexTab) {
          case 0:
            txnSearchList = cachedAllTxnList;
            break;
          case 1:
            txnSearchList = cachedCreditTxnList;
            break;
          case 2:
            txnSearchList = cachedDebitTxnList;
            break;
          default:
            txnSearchList = cachedAllTxnList;
        }

        for (var element in txnSearchList) {
          switch (baseOnTxnField.toLowerCase()) {
            case 'transaction description':
              if (element.narration.contains(query)) {
                searchedResultList.add(element);
              }
              break;
            case 'transaction type':
              if (element.drCr.contains(query)) {
                searchedResultList.add(element);
              }
              break;
            case 'transaction amount':
              if (element.amount.contains(query)) {
                searchedResultList.add(element);
              }
              break;
            case 'account number':
              if (element.accountNumber.contains(query)) {
                searchedResultList.add(element);
              }
              break;
            case 'account name':
              if (element.accountName.contains(query)) {
                searchedResultList.add(element);
              }
              break;
            case 'bank name':
              if (element.bankName.contains(query)) {
                searchedResultList.add(element);
              }
              break;
            default:
          }
        }

        cachedSearchedResultTxnList = searchedResultList;

        switch (indexTab) {
          case 0:
            cachedAllTxnList = searchedResultList.isNotEmpty ? searchedResultList : cachedAllTxnList;
            break;
          case 1:
            cachedCreditTxnList = searchedResultList.isNotEmpty ? searchedResultList : cachedCreditTxnList;
            break;
          case 2:
            cachedDebitTxnList = searchedResultList.isNotEmpty ? searchedResultList : cachedDebitTxnList;
            break;
          default:
            cachedAllTxnList = searchedResultList.isNotEmpty ? searchedResultList : cachedAllTxnList;
        }

        emit(
          state.copyWith(
            currentTxnTab: currentIndexTab,
            allTxnList: cachedAllTxnList,
            creditTxnList: cachedCreditTxnList,
            debitTxnList: cachedDebitTxnList,
          ),
        );
      }
    });
  }
}
