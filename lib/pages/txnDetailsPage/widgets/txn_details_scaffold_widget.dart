import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';
import 'package:transactions_list/pages/txnDetailsPage/widgets/txn_details_button_widget.dart';
import 'package:transactions_list/pages/txnDetailsPage/widgets/txn_details_header_widget.dart';
import 'package:transactions_list/pages/txnDetailsPage/widgets/txn_details_property_value_widget.dart';
import 'package:transactions_list/pages/txnDetailsPage/widgets/txn_details_widget.dart';

class TxnDetailsScaffoldWidget extends StatefulWidget {
  final Map<String, dynamic> txnData;
  const TxnDetailsScaffoldWidget({
    Key? key,
    required this.txnData,
  }) : super(key: key);

  @override
  State<TxnDetailsScaffoldWidget> createState() =>
      _TxnDetailsScaffoldWidgetState();
}

class _TxnDetailsScaffoldWidgetState extends State<TxnDetailsScaffoldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> txnData = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      txnData = widget.txnData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const TxnDetailsHeaderWidget(),
          SingleChildScrollView(
            child: TxnDetailsWidget(
              amount: txnData['amount'],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Text(
                        'Details:',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TxnDetailsProperyValueWidget(
                      property: 'Date and Time',
                      value: txnData['dateTime'],
                      isItForTxnReference: false,
                    ),
                    TxnDetailsProperyValueWidget(
                      property: 'Reference',
                      value: txnData['paymentRef'],
                      isItForTxnReference: true,
                    ),
                    TxnDetailsProperyValueWidget(
                      property: 'Type',
                      value: txnData['txnType'],
                      isItForTxnReference: false,
                    ),
                    TxnDetailsProperyValueWidget(
                      property: 'Balance',
                      value: txnData['amount'],
                      isItForTxnReference: false,
                    ),
                    TxnDetailsProperyValueWidget(
                      property: 'Narration',
                      value: txnData['narration'],
                      isItForTxnReference: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: TxnDetailsButtonWidget(),
          ),
        ],
      ),
    );
  }
}
