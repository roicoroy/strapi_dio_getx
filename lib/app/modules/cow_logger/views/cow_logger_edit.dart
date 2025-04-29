import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/input_text_field.dart';
import '../../../model/cow_logger.dart' as cow_logger;
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_edit_controller.dart';
import 'cow_logger_add.dart';

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
        title: const Text('CowLoggerDetailsEdit'),
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
              Obx(() {
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
            ],
          ),
        ),
      ),
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

