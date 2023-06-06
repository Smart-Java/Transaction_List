import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';

class TxnDetailsWidget extends StatelessWidget {
  final Widget child;
  final String amount;
  const TxnDetailsWidget({Key? key, required this.child, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70.0,
              width: 70.0,
              decoration: const BoxDecoration(
                color: AppColors.lightBlueColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assest/images/logo.png',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              amount,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
        child,
      ],
    );
  }
}
