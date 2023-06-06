import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';

class TxnDetailsProperyValueWidget extends StatelessWidget {
  final String property;
  final String value;
  const TxnDetailsProperyValueWidget({
    Key? key,
    required this.property,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                property,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.txnDetailsKeyColor,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Divider(
            height: 1.5,
            thickness: 1.5,
            color: AppColors.greyColor,
          )
        ],
      ),
    );
  }
}
