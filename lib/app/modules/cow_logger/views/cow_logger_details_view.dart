import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/input_text_field.dart';
import '../controllers/cow_logger_details_controller.dart';

// ignore: must_be_immutable
class CowLoggerDetailsView extends GetView<CowLoggerDetailsController> {
  CowLoggerDetailsView({super.key});
  final CowLoggerDetailsController ctr = Get.put(CowLoggerDetailsController());

  // cow_logger.Datum? log = Get.arguments['log'];
  dynamic log = Get.arguments['log'];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ctr.setUpLog(log);
    if (log != null) {
      ctr.isEdit?.value = true;
    } else {
      ctr.isEdit?.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerDetailsView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
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
                const SizedBox(height: 3),
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
                    controller.getImage(ImageSource.camera);
                  },
                  child: Text('Camera'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  child: Text('Gallery'),
                ),
                const SizedBox(height: 10),
                Obx(
                  () =>
                      controller.selectedImagePath?.value != ""
                          ? Image.file(
                            width: 200,
                            height: 200,
                            File(controller.selectedImagePath!.value),
                          )
                          : const SizedBox(),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                Obx(
                  () =>
                      controller.remoteImagePath?.value != ""
                          ? Image.network(
                            controller.remoteImagePath!.value,
                            width: 200,
                            height: 200,
                          )
                          : const SizedBox(),
                ),
                const SizedBox(height: 20),
                const Spacer(),
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
                  return ctr.isEdit!.value
                      ? controller.updateLog()
                      : controller.saveNewLog();
                }
              },
              child: Text(ctr.isEdit!.value ? 'updateLog' : 'saveNewLog'),
            ),
          ],
        ),
      ),
    );
  }
}
