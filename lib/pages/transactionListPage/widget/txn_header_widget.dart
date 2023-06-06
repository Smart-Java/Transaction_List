import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/event/transaction_list_event.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/state/transaction_list_state.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/transaction_list_bloc.dart';
import 'package:transactions_list/util/exitConfirmationWidget/exit_confirmation_widget.dart';

class TxnHeaderWidget extends StatefulWidget {
  const TxnHeaderWidget({Key? key}) : super(key: key);

  @override
  State<TxnHeaderWidget> createState() => _TxnHeaderWidgetState();
}

class _TxnHeaderWidgetState extends State<TxnHeaderWidget> {
  final TextEditingController textSearchController = TextEditingController();

  List filterSearchList = [
    'Transaction description',
    'Transaction type',
    'Transaction amount',
    'Account number',
    'Account name',
    'Bank name',
  ];

  List tabList = [
    {'title': 'All', 'color': AppColors.blackColor},
    {'title': 'Credit', 'color': AppColors.greenColor},
    {'title': 'Debit', 'color': AppColors.redColor}
  ];

  int currentIndexTab = 0;

  String filterBaseOn = '';

  @override
  void initState() {
    filterBaseOn = filterSearchList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionListBloc, TransactionsListState>(
      listener: (context, state) {
        setState(() {
          currentIndexTab = state.currentTxnTab!;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 70.0,
          bottom: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return ExitConfirmationWidget(
                            noToExitFunctionality: () {
                              context.router.pop();
                            },
                            yesToExitFunctionality: () {
                              exit(1);
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlueColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
              ),
              child: Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textSearchController,
                          onChanged: (value) {
                            BlocProvider.of<TransactionListBloc>(context).add(
                              FilterTxnListEvent(
                                searchBase: filterBaseOn,
                                searchQuery: value,
                                searchIndexTab: currentIndexTab,
                              ),
                            );
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.darkBlueColor,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return searchTxnListWidget();
                            },
                          );
                        },
                        child: Container(
                          height: 30.0,
                          width: 75.0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: AppColors.lightBlueColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Filter',
                                style: TextStyle(
                                  color: AppColors.darkBlueColor,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                width: 3.0,
                              ),
                              Icon(
                                Icons.filter_list_alt,
                                color: AppColors.darkBlueColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(tabList.length, (index) {
                  return TextButton(
                    onPressed: () {
                      BlocProvider.of<TransactionListBloc>(context).add(
                        GetTransactionListEvent(tabIndex: index),
                      );
                    },
                    child: Text(
                      tabList[index]['title'],
                      style: TextStyle(
                        color: tabList[index]['color'],
                      ),
                    ),
                  );
                }),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(tabList.length, (index) {
                      return currentIndexTab == index
                          ? const SizedBox(
                              width: 50.0,
                              child: Divider(
                                color: AppColors.darkBlueColor,
                                height: 1.5,
                                thickness: 1.5,
                              ),
                            )
                          : Container();
                    }),
                  ],
                ),
                const Divider(
                  color: AppColors.greyColor,
                  height: 1.5,
                  thickness: 1.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTxnListWidget() {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.only(
          top: 10.0,
          right: 10.0,
          left: 10.0,
        ),
        title: const Text(
          'Filter Txn base on',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SizedBox(
          height: 350.0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(filterSearchList.length, (index) {
                  var filterKey = filterSearchList[index];
                  return RadioListTile<String>(
                    value: filterKey,
                    title: Text(
                      filterKey,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    groupValue: filterBaseOn,
                    onChanged: (value) {
                      var userChoice = value as String;
                      setState(() {
                        filterBaseOn = userChoice;
                      });
                      debugPrint(userChoice.toString());
                    },
                    activeColor: AppColors.blackColor,
                  );
                }),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Future.delayed(const Duration()).then((value) {
                setState(() {
                  filterBaseOn = filterSearchList[0];
                });
              }).then((value) {
                Navigator.pop(context);
              });
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Okay',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
