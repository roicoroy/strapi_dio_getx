import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_spacing.dart';
import '../../../../theme/theme_controller.dart';
import '../dialogs/rating_dialog.dart';
import 'side_menu.dart';
import 'toogle_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedMenu = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor:
          isDarkMode(context) ? AppColors.kDarkInput : AppColors.kPrimary,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.twentyHorizontal,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              // ProfileImageCard(
              //   onTap: () {
              //     Future.delayed(const Duration(milliseconds: 100)).then((
              //       value,
              //     ) {
              //       Get.back();
              //       // Get.to(() => const ProfileView());
              //     });
              //   },
              // ),
              SizedBox(height: 50.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 0;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((
                    value,
                  ) {
                    Get.back();
                    // Get.to(() => const CalendarView());
                  });
                },
                icon: AppAssets.kCalendar,
                isSelected: selectedMenu == 0,
                text: 'Calendar',
              ),
              SizedBox(height: 10.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 1;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((
                    value,
                  ) {
                    Get.back();
                    // Get.to(() => const PaymentMethodView());
                  });
                },
                icon: AppAssets.kPaymentMethod,
                isSelected: selectedMenu == 1,
                text: 'Payment Methods',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 2;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((
                    value,
                  ) {
                    Get.back();
                    // Get.to(() => const AddressView());
                  });
                },
                icon: AppAssets.kAddress,
                isSelected: selectedMenu == 2,
                text: 'Address',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 3;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((
                    value,
                  ) {
                    Get.back();
                    // Get.to(() => const NotificationView());
                  });
                },
                icon: AppAssets.kNotification,
                isSelected: selectedMenu == 3,
                text: 'Notifications',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 4;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((
                    value,
                  ) {
                    Get.back();
                    // Get.to(() => const OffersView());
                  });
                },
                icon: AppAssets.kOffers,
                isSelected: selectedMenu == 4,
                text: 'Offers',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 5;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((
                    value,
                  ) {
                    Get.back();
                    // Get.to(() => const ReferFriend());
                  });
                },
                icon: AppAssets.kFriends,
                isSelected: selectedMenu == 5,
                text: 'Refer a Friend',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 6;
                  });
                },
                icon: AppAssets.kSupport,
                isSelected: selectedMenu == 6,
                text: 'Support',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 7;
                  });
                  showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return RatingDialog(opacity: a1, scale: a1);
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context,
                    pageBuilder: (context, animation1, animation2) {
                      return const SizedBox();
                    },
                  );
                },
                icon: AppAssets.kStar,
                isSelected: selectedMenu == 7,
                text: 'Rate Us',
              ),
              const Spacer(),
              const Divider(color: AppColors.kHint),
              SideMenu(
                isSelected: false,
                icon: AppAssets.kHelp,
                text: 'Color Scheme',
              ),
              GetBuilder<ThemeController>(
                init: ThemeController(),
                initState: (_) {},
                builder: (ww) {
                  return ToggleButton(
                    onDarkModeSelected: () {
                      ww.setTheme('dark');
                    },
                    onLightModeSelected: () {
                      ww.setTheme('light');
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
