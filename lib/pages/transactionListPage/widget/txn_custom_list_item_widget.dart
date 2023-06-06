import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';

class TxnCustomListItemWidget extends StatelessWidget {
  final String txnTitle;
  final String txnDateAndTime;
  final String txnAmount;
  final bool isItACreditTxn;
  final VoidCallback navFunctionality;
  const TxnCustomListItemWidget({
    Key? key,
    required this.txnAmount,
    required this.txnDateAndTime,
    required this.txnTitle,
    required this.navFunctionality,
    required this.isItACreditTxn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navFunctionality,
      child: Container(
        color: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.txnIconBgColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        isItACreditTxn == true
                            ? 'assest/images/credit.png'
                            : 'assest/images/debit.png',
                      ),
                    )),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        txnTitle.replaceFirst(
                            txnTitle[0], txnTitle[0].toUpperCase()),
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        txnDateAndTime,
                        style: const TextStyle(
                          color: AppColors.txnDateTimeColor,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text(
                    '${isItACreditTxn == true ? '+' : '-'} $txnAmount',
                    style: TextStyle(
                      color: isItACreditTxn == true
                          ? AppColors.greenColor
                          : AppColors.redColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: AppColors.greyColor,
              height: 1.5,
              thickness: 1.5,
            )
          ],
        ),
      ),
    );
  }
}
