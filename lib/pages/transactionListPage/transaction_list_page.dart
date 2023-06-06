import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_list/di/injection.dart';
import 'package:transactions_list/pages/transactionListPage/bloc/transaction_list_bloc.dart';
import 'package:transactions_list/pages/transactionListPage/widget/txn_page_scaffold_widget.dart';

class TransactionListPage extends StatelessWidget {
  const TransactionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<TransactionListBloc>(),
        child: const TxnPageScaffoldWidget()),
    );
  }
}
