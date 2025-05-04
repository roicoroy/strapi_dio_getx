import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_typography.dart';
import '../../../model/door_hub/services_model.dart';
import '../../widgets/animations/heart_animation.dart';

class LoggerGridCard extends StatefulWidget {
  final ServicesModel service;

  const LoggerGridCard({Key? key, required this.service})
      : super(key: key);

  @override
  State<LoggerGridCard> createState() => _LoggerGridCardCardState();
}

class _LoggerGridCardCardState extends State<LoggerGridCard> {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext _, VoidCallback openContainer) {
          return Text('data');
          // return ServicesDetailView(services: widget.service);
        },
        middleColor: isDarkMode(context)
            ? AppColors.kDarkSurfaceColor
            : AppColors.kWhite,
        openColor: isDarkMode(context)
            ? AppColors.kDarkSurfaceColor
            : AppColors.kWhite,
        closedColor: isDarkMode(context)
            ? AppColors.kDarkSurfaceColor
            : AppColors.kWhite,
        closedShape: const RoundedRectangleBorder(),
        closedElevation: 0.0,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 147.w,
                  height: 158.h,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: AssetImage(widget.service.image),
                        fit: BoxFit.cover,
                      )),
                  child: HeartAnimationWidget(
                    isAnimating: isFavorite,
                    duration: const Duration(milliseconds: 150),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: isFavorite ? Colors.red : AppColors.kWhite,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Text(widget.service.name, style: AppTypography.kMedium14),
                SizedBox(height: 4.h),
                Text('Starts From',
                    style: AppTypography.kLight12.copyWith(
                        color: AppColors.kNeutral04.withOpacity(0.75))),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.5.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          color: AppColors.kLime,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Text('\$ ${widget.service.price}',
                          style: AppTypography.kMedium12),
                    ),
                    const Spacer(),
                    // SecondaryRatingWidget(service: widget.service)
                  ],
                )
              ],
            ),
          );
        });
  }
}
