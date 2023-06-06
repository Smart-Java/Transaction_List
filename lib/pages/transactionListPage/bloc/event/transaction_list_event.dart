import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class TransactionListEvent extends Equatable {
  const TransactionListEvent();
}

// ignore: must_be_immutable
class GetTransactionListEvent extends TransactionListEvent {
  int tabIndex;
  GetTransactionListEvent({
    required this.tabIndex,
  }) : super();

  @override
  List<Object?> get props => [tabIndex];
}

// ignore: must_be_immutable
class GetTransactionListBaseOnTabEvent extends TransactionListEvent {
  int tabIndex;
  GetTransactionListBaseOnTabEvent({required this.tabIndex}) : super();

  @override
  List<Object?> get props => [
        tabIndex,
      ];
}

// ignore: must_be_immutable
class FilterTxnListEvent extends TransactionListEvent {
  String searchQuery;
  String searchBase;
  int searchIndexTab;
  FilterTxnListEvent({
    required this.searchBase,
    required this.searchQuery,
    required this.searchIndexTab,
  }) : super();

  @override
  List<Object?> get props => [
        searchQuery,
        searchBase,
        searchIndexTab,
      ];
}

// ignore: must_be_immutable
class AscDescOrderOnTransactionListEvent extends TransactionListEvent {
  bool isItForAscOrder;

  AscDescOrderOnTransactionListEvent({
    required this.isItForAscOrder,
  }) : super();

  @override
  List<Object?> get props => [
        isItForAscOrder,
      ];
}
