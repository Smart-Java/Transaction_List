// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    TransactionListRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const TransactionListPage(),
      );
    },
    TxnDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TxnDetailsRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: TxnDetailsPage(
          key: args.key,
          txnData: args.txnData,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          TransactionListRoute.name,
          path: '/',
        ),
        RouteConfig(
          TxnDetailsRoute.name,
          path: '/txn-details-page',
        ),
      ];
}

/// generated route for
/// [TransactionListPage]
class TransactionListRoute extends PageRouteInfo<void> {
  const TransactionListRoute()
      : super(
          TransactionListRoute.name,
          path: '/',
        );

  static const String name = 'TransactionListRoute';
}

/// generated route for
/// [TxnDetailsPage]
class TxnDetailsRoute extends PageRouteInfo<TxnDetailsRouteArgs> {
  TxnDetailsRoute({
    Key? key,
    required Map<String, dynamic> txnData,
  }) : super(
          TxnDetailsRoute.name,
          path: '/txn-details-page',
          args: TxnDetailsRouteArgs(
            key: key,
            txnData: txnData,
          ),
        );

  static const String name = 'TxnDetailsRoute';
}

class TxnDetailsRouteArgs {
  const TxnDetailsRouteArgs({
    this.key,
    required this.txnData,
  });

  final Key? key;

  final Map<String, dynamic> txnData;

  @override
  String toString() {
    return 'TxnDetailsRouteArgs{key: $key, txnData: $txnData}';
  }
}
