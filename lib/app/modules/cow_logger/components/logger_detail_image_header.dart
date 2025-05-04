import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_typography.dart';
import '../../../model/cow_logger.dart';
import '../../../model/door_hub/services_model.dart' show ServicesModel;

class LoggerDetailImageHeader extends StatelessWidget {
  final ServicesModel service;
  final Datum log;

  const LoggerDetailImageHeader({
    super.key,
    required this.service,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: AssetImage(service.image),
          image:
              log.image?.url != null
                  ? NetworkImage(
                    log.image?.url ?? 'https://placehold.co/600x400',
                  )
                  : AssetImage('assets/user_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 270.h,
            width: Get.width,
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.name,
                  style: AppTypography.kBold24.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
