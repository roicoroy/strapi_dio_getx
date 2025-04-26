import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/input_text_field.dart';
import '../../../model/cow_logger.dart' as cow_logger;
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_details_controller.dart';
import 'catalog_screen.dart' show CatalogScreen, GraduationScreen;

// ignore: must_be_immutable
class CowLoggerEditView extends GetView<CowLoggerDetailsController> {
  final cowLoggerDetailsFormKey = GlobalKey<FormState>();

  cow_logger.Datum? log = Get.arguments['log'];

  CowLoggerEditView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setUpLog(log);

    return Text('data');
  }
}

class GoiabaTheme {
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
