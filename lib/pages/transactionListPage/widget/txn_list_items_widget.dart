// ignore: depend_on_referenced_packages
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';
import 'package:transactions_list/config/appRouterHandler/app_router.dart';
import 'package:transactions_list/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/state/transaction_list_state.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/transaction_list_bloc.dart';
import 'package:transactions_list/pages/transactionListPage/data/model/transaction_list_model.dart';
import 'package:transactions_list/pages/transactionListPage/widget/txn_custom_list_item_widget.dart';
import 'package:transactions_list/util/listNotReadyWidget/list_not_ready_widget.dart';

class TxnListItemsWidget extends StatefulWidget {
  const TxnListItemsWidget({Key? key}) : super(key: key);

  @override
  State<TxnListItemsWidget> createState() => _TxnListItemsWidgetState();
}

class _TxnListItemsWidgetState extends State<TxnListItemsWidget> {
  List<TransactionListModel> txnList = [];

  bool loadShimmer = false;

  String emptyTxnList = 'Empty transaction record';

  int indexTab = 0;

  Size deviceSize = const Size(0.0, 0.0);

  var monthOfTheYear = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'Sept',
    'October',
    'Nov',
    'Dec'
  ];

  NumberFormat currencyFormat = NumberFormat.currency(
    name: 'NGN',
    decimalDigits: 2,
    locale: 'en-us',
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocConsumer<TransactionListBloc, TransactionsListState>(
      listener: (context, state) {
        if (state.allTxnList != null &&
            state.allTxnList!.isEmpty &&
            state.requestMessage != null) {
          var message = state.requestMessage as String;
          setState(() {
            emptyTxnList = message;
          });
        }

        if (state.isThereAnySearchResult == false) {
          if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
            setState(() {
              emptyTxnList =
                  '${state.searchQuery} is not found in the txn list';
            });
          } else {
            setState(() {
              emptyTxnList = 'Which txn are you looking for?';
            });
          }
        }

        setState(() {
          indexTab = state.currentTxnTab!;
        });

        if (state.allTxnList != null &&
            state.creditTxnList != null &&
            state.debitTxnList != null &&
            state.isSearchOn != true) {
          setState(() {
            if (indexTab == 0) {
              txnList = state.allTxnList!;
            } else if (indexTab == 1) {
              txnList = state.creditTxnList!;
            } else {
              txnList = state.debitTxnList!;
            }
          });
        } 
        
        if (state.allSearchTxnList != null &&
            state.creditSearchTxnList != null &&
            state.debitSearchTxnList != null &&
            state.isSearchOn == true) {
          setState(() {
            if (indexTab == 0) {
              txnList = state.allSearchTxnList!;
            } else if (indexTab == 1) {
              txnList = state.creditSearchTxnList!;
            } else {
              txnList = state.debitSearchTxnList!;
            }
          });
        } 



        if (state.isLoading == true || state.isLoading == false) {
          setState(() {
            loadShimmer = state.isLoading!;
          });
        }

        if (state.requestMessage != null &&
            state.requestMessage!.isNotEmpty &&
            state.isRequestSuccessful == false) {
          displayMessage(context, state.requestMessage!);
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              right: 10.0,
              left: 10.0,
            ),
            decoration: loadShimmer == true
                ? const BoxDecoration()
                : const BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
            child: loadShimmer == true
                ? ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppShimmerEffect.rectangular(
                          height: 70.0,
                          width: double.infinity,
                        ),
                      );
                    },
                  )
                : txnList.isNotEmpty
                    ? ListView.builder(
                        itemCount: txnList.length,
                        itemBuilder: (context, index) {
                          String dateTimeFromDb = txnList[index].date;
                          String dateTime = '';
                          String txnDateTime = '';

                          String txnType = '';

                          String amountStringValue = txnList[index].amount;

                          double amount = double.parse(amountStringValue);

                          bool creditTxn = false;

                          if (indexTab == 1) {
                            creditTxn = true;
                            txnType = 'Credit';
                          } else if (indexTab == 2) {
                            creditTxn = false;
                            txnType = 'Debit';
                          } else {
                            if (txnList[index].drCr.toLowerCase() ==
                                'withdrawal') {
                              creditTxn = false;
                              txnType = 'Debit';
                            } else {
                              creditTxn = true;
                              txnType = 'Credit';
                            }
                          }
                          if (dateTimeFromDb.isNotEmpty) {
                            var parseDateTime = DateTime.parse(dateTimeFromDb);
                            var time = TimeOfDay.fromDateTime(parseDateTime);
                            txnDateTime =
                                '${parseDateTime.day}/${parseDateTime.month}/${parseDateTime.year} ${time.format(context)}';
                            dateTime =
                                '${parseDateTime.day}, ${monthOfTheYear[parseDateTime.month - 1]}, ${parseDateTime.year}, ${time.format(context)}';
                          }

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TxnCustomListItemWidget(
                              txnAmount: currencyFormat.format(amount),
                              txnDateAndTime: dateTime,
                              txnTitle: txnList[index].narration,
                              navFunctionality: () {
                                context.router.push(
                                  TxnDetailsRoute(
                                    txnData: {
                                      'dateTime': txnDateTime,
                                      'paymentRef':
                                          txnList[index].paymentReference,
                                      'txnType': txnType,
                                      'balance': currencyFormat.format(amount),
                                      'amount': currencyFormat.format(amount),
                                      'narration': txnList[index].narration,
                                    },
                                  ),
                                );
                              },
                              isItACreditTxn: creditTxn,
                            ),
                          );
                        },
                      )
                    : ListNotReadyWidget(
                        message: emptyTxnList,
                      ),
          ),
        );
      },
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(message),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: AppColors.blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height - 100,
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }
}
