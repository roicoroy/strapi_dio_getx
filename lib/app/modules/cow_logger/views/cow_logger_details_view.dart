import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/input_text_field.dart';
import '../../../model/cow_logger.dart' as cow_logger;
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_details_controller.dart';

// ignore: must_be_immutable
class CowLoggerDetailsView extends GetView<CowLoggerDetailsController> {
  CowLoggerDetailsView({super.key});
  // final CowLoggerDetailsController ctr = Get.put(CowLoggerDetailsController());

  cow_logger.Datum? log = Get.arguments['log'];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.setUpLog(log);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerDetailsView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed:
              () => {
                Get.toNamed(Routes.COW_LOGGER, arguments: {'loadLogs': true}),
              },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Spacer(flex: 2),
                const SizedBox(height: 20),
                Obx(() {
                  if (controller.remoteImagePath?.value != "") {
                    return Center(
                      child: Image.network(
                        height: 100,
                        controller.remoteImagePath!.value,
                      ),
                    );
                    // return Center(
                    //   child: CircularProgressIndicator(color: Colors.green),
                    // );
                  } else if (controller.selectedImagePath?.value != "") {
                    return Center(
                      child: Image.file(
                        height: 100,
                        File(controller.selectedImagePath!.value),
                      ),
                    );
                    // return Center(
                    //   child: CircularProgressIndicator(color: Colors.green),
                    // );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  }
                }),
                const SizedBox(height: 10),
                // const Spacer(),
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
                const SizedBox(height: 10),
                // const Spacer(),
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
                const SizedBox(height: 10),
                // const Spacer(),
                Obx(
                  () => ElevatedButton(
                    onPressed: () => controller.selectDate(Get.context),
                    child: Text(
                      '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
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

class CustomDialog extends GetView<CowLoggerDetailsController> {
  CustomDialog({super.key, required context});

  ImageSource? src;
  late bool val = false;

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text('Select Image source'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
