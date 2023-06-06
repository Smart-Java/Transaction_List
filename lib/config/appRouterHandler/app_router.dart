import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:transactions_list/pages/transactionListPage/transaction_list_page.dart';
import 'package:transactions_list/pages/txnDetailsPage/txn_details_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: TransactionListPage,
      initial: true,
    ),
    AutoRoute(
      page: TxnDetailsPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
