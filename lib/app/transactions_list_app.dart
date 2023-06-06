import 'package:flutter/material.dart';
import 'package:transactions_list/config/appRouterHandler/app_router.dart';
import 'package:transactions_list/config/appTheme/app_theme.dart';

final _appRouter = AppRouter();

class TransactionsListApp extends StatelessWidget {

  const TransactionsListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.day(),
      themeMode: ThemeMode.light,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate()
    );
  }
}
