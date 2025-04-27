import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/input_text_field.dart';
import '../../../model/cow_logger.dart' as cow_logger;
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_edit_controller.dart';

// ignore: must_be_immutable
class CowLoggerEdit extends GetView<CowLoggerEditController> {
  final cowLoggerDetailsFormKey = GlobalKey<FormState>();

  cow_logger.Datum? log = Get.arguments['log'];

  CowLoggerEdit({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setUpLog(log);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerDetailsView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: ElevatedButton(
          onPressed:
              () => {
                Get.toNamed(Routes.COW_LOGGER, arguments: {'loadLogs': true}),
              },
          child: Text('Back'),
        ),
      ),
      body: Form(
        key: cowLoggerDetailsFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoiabaTheme.mediumVerticalPadding,
              InputTextField(
                title: 'Name',
                textEditingController: controller.name,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              GoiabaTheme.mediumVerticalPadding,
              InputTextField(
                title: 'description',
                textEditingController: controller.description,
                validation: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty";
                  }
                  return null;
                },
              ),
              GoiabaTheme.largeVerticalPadding,
              Obx(
                () => ElevatedButton(
                  onPressed: () => controller.selectDate(Get.context),
                  child: Text(
                    '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                  ),
                ),
              ),
              GoiabaTheme.mediumVerticalPadding,
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Choose",
                    middleText: "Image Source",
                    backgroundColor: Colors.green,
                    titleStyle: TextStyle(color: Colors.white),
                    middleTextStyle: TextStyle(color: Colors.white),
                    barrierDismissible: false,
                    radius: 50,
                    content: Column(
                      children: [
                        ElevatedButton(
                          onPressed:
                              () => {
                                controller.getImage(ImageSource.camera),
                                Navigator.of(context).pop(),
                              },
                          child: Text('Camera'),
                        ),
                        ElevatedButton(
                          onPressed:
                              () => {
                                controller.getImage(ImageSource.gallery),
                                Navigator.of(context).pop(),
                              },
                          child: Text('Gallery'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Get Image'),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.remoteImagePath?.value != "") {
                    return Center(
                      child: Image.network(
                        height: 100,
                        controller.remoteImagePath!.value,
                      ),
                    );
                  } else if (controller.selectedImagePath?.value != "") {
                    return Center(
                      child: Image.file(
                        height: 100,
                        File(controller.selectedImagePath!.value),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  }
                }),
              ),
              //
              //
              // Obx(() {
              //   if (controller.remoteImagePath?.value != "") {
              //     return Center(
              //       child: Image.network(
              //         height: 100,
              //         controller.remoteImagePath!.value,
              //       ),
              //     );
              //   } else if (controller.selectedImagePath?.value != "") {
              //     return Center(
              //       child: Image.file(
              //         height: 100,
              //         File(controller.selectedImagePath!.value),
              //       ),
              //     );
              //   } else {
              //     return Center(
              //       child: CircularProgressIndicator(color: Colors.green),
              //     );
              //   }
              // }),
              // const SizedBox(height: 15),
              // const Spacer(),
              // InputTextField(
              //   title: 'Name',
              //   textEditingController: controller.name,
              //   validation: (String? value) {
              //     if (value == null || value.isEmpty) {
              //       return "This field can't be empty";
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(height: 15),
              // // const Spacer(),
              // InputTextField(
              //   title: 'description',
              //   textEditingController: controller.description,
              //   validation: (String? value) {
              //     if (value == null || value.isEmpty) {
              //       return "This field can't be empty";
              //     }
              //     return null;
              //   },
              // ),
              // const SizedBox(height: 15),
              // // const Spacer(),
              // Obx(
              //   () => ElevatedButton(
              //     onPressed: () => controller.selectDate(Get.context),
              //     child: Text(
              //       '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 15),
              // ElevatedButton(
              //   onPressed: () {
              //     Get.defaultDialog(
              //       title: "Choose",
              //       middleText: "Image Source",
              //       backgroundColor: Colors.green,
              //       titleStyle: TextStyle(color: Colors.white),
              //       middleTextStyle: TextStyle(color: Colors.white),
              //       barrierDismissible: false,
              //       radius: 50,
              //       content: Column(
              //         children: [
              //           ElevatedButton(
              //             onPressed:
              //                 () => {
              //                   controller.getImage(ImageSource.camera),
              //                   Navigator.of(context).pop(),
              //                 },
              //             child: Text('Camera'),
              //           ),
              //           ElevatedButton(
              //             onPressed:
              //                 () => {
              //                   controller.getImage(ImageSource.gallery),
              //                   Navigator.of(context).pop(),
              //                 },
              //             child: Text('Gallery'),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   child: Text('Get Image'),
              // ),
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Form(
      // key: formKey,
      //       child: Wrap(
      //         direction: Axis.horizontal,
      //         alignment: WrapAlignment.center,
      //         runSpacing: 32,
      //         children: [
      //           const Spacer(flex: 2),
      // Obx(() {
      //   if (controller.remoteImagePath?.value != "") {
      //     return Center(
      //       child: Image.network(
      //         height: 100,
      //         controller.remoteImagePath!.value,
      //       ),
      //     );
      //   } else if (controller.selectedImagePath?.value != "") {
      //     return Center(
      //       child: Image.file(
      //         height: 100,
      //         File(controller.selectedImagePath!.value),
      //       ),
      //     );
      //   } else {
      //     return Center(
      //       child: CircularProgressIndicator(color: Colors.green),
      //     );
      //   }
      // }),
      // const SizedBox(height: 15),
      // const Spacer(),
      // InputTextField(
      //   title: 'Name',
      //   textEditingController: controller.name,
      //   validation: (String? value) {
      //     if (value == null || value.isEmpty) {
      //       return "This field can't be empty";
      //     }
      //     return null;
      //   },
      // ),
      // const SizedBox(height: 15),
      // // const Spacer(),
      // InputTextField(
      //   title: 'description',
      //   textEditingController: controller.description,
      //   validation: (String? value) {
      //     if (value == null || value.isEmpty) {
      //       return "This field can't be empty";
      //     }
      //     return null;
      //   },
      // ),
      // const SizedBox(height: 15),
      // // const Spacer(),
      // Obx(
      //   () => ElevatedButton(
      //     onPressed: () => controller.selectDate(Get.context),
      //     child: Text(
      //       '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
      //     ),
      //   ),
      // ),
      // const SizedBox(height: 15),
      // ElevatedButton(
      //   onPressed: () {
      //     Get.defaultDialog(
      //       title: "Choose",
      //       middleText: "Image Source",
      //       backgroundColor: Colors.green,
      //       titleStyle: TextStyle(color: Colors.white),
      //       middleTextStyle: TextStyle(color: Colors.white),
      //       barrierDismissible: false,
      //       radius: 50,
      //       content: Column(
      //         children: [
      //           ElevatedButton(
      //             onPressed:
      //                 () => {
      //                   controller.getImage(ImageSource.camera),
      //                   Navigator.of(context).pop(),
      //                 },
      //             child: Text('Camera'),
      //           ),
      //           ElevatedButton(
      //             onPressed:
      //                 () => {
      //                   controller.getImage(ImageSource.gallery),
      //                   Navigator.of(context).pop(),
      //                 },
      //             child: Text('Gallery'),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      //   child: Text('Get Image'),
      // ),
      //           const SizedBox(height: 5),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                if (cowLoggerDetailsFormKey.currentState!.validate()) {
                  return controller.isEdit!.value
                      ? controller.updateLog()
                      : controller.saveNewLog();
                }
              },
              child: Text(
                controller.isEdit!.value ? 'Update Log' : 'Save New Log',
              ),
            ),
          ],
        ),
      ),
    );
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
