import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';

class TxnDetailsButtonWidget extends StatelessWidget {
  const TxnDetailsButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.darkBlueColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'DOWNLOAD RECEIPT',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Share with Bankly Assistant',
              style: TextStyle(
                color: AppColors.darkBlueColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
