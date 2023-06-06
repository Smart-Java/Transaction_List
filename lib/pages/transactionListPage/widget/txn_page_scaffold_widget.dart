import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/event/transaction_list_event.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/state/transaction_list_state.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/transaction_list_bloc.dart';
import 'package:transactions_list/pages/transactionListPage/widget/txn_header_widget.dart';
import 'package:transactions_list/pages/transactionListPage/widget/txn_list_items_widget.dart';
import 'package:transactions_list/util/exitConfirmationWidget/exit_confirmation_widget.dart';

class TxnPageScaffoldWidget extends StatefulWidget {
  const TxnPageScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<TxnPageScaffoldWidget> createState() => _TxnPageScaffoldWidgetState();
}

class _TxnPageScaffoldWidgetState extends State<TxnPageScaffoldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showRefresh = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TransactionListBloc>(context).add(GetTransactionListEvent(
      tabIndex: 0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionListBloc, TransactionsListState>(
      listener: (context, state) {
        if (state.allTxnList != null &&
            state.creditTxnList != null &&
            state.debitTxnList != null) {
          setState(() {
            showRefresh = true;
          });
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          var exitApp = false;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return ExitConfirmationWidget(
                noToExitFunctionality: () {
                  setState(() {
                    exitApp = false;
                  });
                  context.router.pop();
                },
                yesToExitFunctionality: () {
                  setState(() {
                    exitApp = true;
                  });
                  exit(1);
                },
              );
            },
          );
          return exitApp;
        },
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TxnHeaderWidget(),
              TxnListItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
