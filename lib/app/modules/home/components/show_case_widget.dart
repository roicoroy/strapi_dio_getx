import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_typography.dart';
import '../../widgets/buttons/primary_button.dart';

class CustomShowCaseWidget extends StatelessWidget {
  final String title;
  final String description;
  final String widgetNumber;
  final VoidCallback onNextTap;
  final String buttonText;
  const CustomShowCaseWidget(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.description,
      required this.widgetNumber,
      required this.onNextTap});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 300.w,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
          color: AppColors.kPrimary, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTypography.kMedium16.copyWith(color: AppColors.kWhite)),
          SizedBox(height: 2.h),
          Text(description,
              style: AppTypography.kExtraLight13
                  .copyWith(color: AppColors.kWhite)),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$widgetNumber of 2',
                style: AppTypography.kLight12.copyWith(color: AppColors.kWhite),
              ),
              PrimaryButton(
                onTap: onNextTap,
                text: buttonText,
                fontSize: 12.sp,
                height: 30.h,
                width: 60.w,
                borderRadius: 30.r,
                color: isDarkMode(context)
                    ? AppColors.kSecondary
                    : AppColors.kWhite,
              )
            ],
          )
        ],
      ),
    );
  }
}
