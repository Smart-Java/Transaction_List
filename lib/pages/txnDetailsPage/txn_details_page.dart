import 'package:flutter/material.dart';
import 'package:transactions_list/pages/txnDetailsPage/widgets/txn_details_scaffold_widget.dart';

class TxnDetailsPage extends StatelessWidget {
  final Map<String, dynamic> txnData;
  const TxnDetailsPage({Key? key, required this.txnData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: TxnDetailsScaffoldWidget(
        txnData: txnData,
      ),
    );
  }
}
