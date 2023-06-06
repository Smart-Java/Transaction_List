import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';

class TxnDetailsHeaderWidget extends StatelessWidget {
  const TxnDetailsHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70.0,
        bottom: 20.0,
        right: 10.0,
        left: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBlueColor,
              ),
              child: const Center(
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: AppColors.darkBlueColor,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                'Transactions',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
