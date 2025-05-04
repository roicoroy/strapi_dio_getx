import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/app_typography.dart';
import '../../../model/cow_logger.dart' as cow_logger;
import '../../../model/door_hub/services_model.dart';
import '../../widgets/containers/primary_container.dart';
import '../../widgets/texts/custom_header_text.dart';

// ignore: must_be_immutable
class LoggerDetailView extends GetView {
  final ServicesModel services;
  final cow_logger.Datum log;
  const LoggerDetailView({
    required this.services,
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            CustomHeaderText(text: 'Type of Property', fontSize: 18.sp),
            SizedBox(height: 16.h),
            Image.network(log.image?.url ?? 'https://placehold.co/600x400'),
            Text(log.description, style: AppTypography.kExtraLight13),

            // PrimaryContainer(
            //   child: Column(
            //     children: [
            //       CustomHeaderText(text: 'Type of Property', fontSize: 18.sp),
            //       SizedBox(height: 16.h),
            //       Image.network(
            //         log.image?.url ?? 'https://placehold.co/600x400',
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16.h),
            // PrimaryContainer(
            //   child: Column(
            //     children: [
            //       Image.network(
            //         log.image?.url ?? 'https://placehold.co/600x400',
            //       ),
            //       SizedBox(height: 16.h),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16.h),
            // PrimaryContainer(
            //   child: Column(
            //     children: [
            //       CustomHeaderText(text: 'Description', fontSize: 18.sp),
            //       SizedBox(height: 16.h),
            //       Text(log.description, style: AppTypography.kExtraLight13),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      // bottomSheet: ServiceSheet(
      //   bookText: 'Book Now',
      //   bookCallback: () {},
      //   isDetailPage: true,
      //   saveCallback: () {},
      // ),
    );
  }
}

class MyTheme {
  static Color get backgroundColor => const Color(0xFFF7F7F7);
  static Color get grey => const Color(0xFF999999);
  static Color get catalogueCardColor =>
      const Color(0xFFBAE5D4).withOpacity(0.5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get courseCardColor => const Color(0xFFEDF1F1);
  static Color get progressColor => const Color(0xFF36F1CD);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme =>
      ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.blueGrey).copyWith(
        cardTheme: const CardTheme(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              catalogueButtonColor,
            ), // Button color
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ), // Text and icon color
          ),
        ),
      );
}
