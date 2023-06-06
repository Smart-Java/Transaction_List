import 'package:flutter/material.dart';
import 'package:transactions_list/config/appColors/app_colors.dart';

class ExitConfirmationWidget extends StatelessWidget {
  final VoidCallback yesToExitFunctionality;
  final VoidCallback noToExitFunctionality;
  const ExitConfirmationWidget({
    Key? key,
    required this.noToExitFunctionality,
    required this.yesToExitFunctionality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 200.0,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Are you sure you want to exit from app?',
                  style: TextStyle(color: AppColors.blackColor, fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: noToExitFunctionality,
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: AppColors.blackColor,
                        width: 2.0,
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: yesToExitFunctionality,
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.blackColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
