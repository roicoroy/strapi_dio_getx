import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/input_text_button.dart';
import '../../../components/input_text_field.dart';
import '../../../model/cow_logger.dart' as cow_logger;
import '../controllers/cow_logger_controller.dart';

// ignore: must_be_immutable
class CowLoggerDetailsView extends GetView<CowLoggerController> {
  CowLoggerDetailsView({super.key});

  dynamic? log = Get.arguments['log'];
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (log != null) {
      name = TextEditingController(text: log.name);
    }
    name = TextEditingController(text: 'test name');
    description = TextEditingController(text: 'test desc');
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
                const Spacer(flex: 3),
                InputTextField(
                  title: 'Name',
                  textEditingController: name,
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
                  textEditingController: description,
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
                      controller.selectedImagePath?.value == ''
                          ? Text(
                            'Select an Image From Camera or Gallery',
                            style: TextStyle(fontSize: 20),
                          )
                          : Image.file(
                            width: 200,
                            height: 200,
                            File(controller.selectedImagePath!.value),
                          ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                InputTextButton(
                  title: "Submit",
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      controller.submitForm(name.text, description.text);
                    }
                  },
                ),
                const Spacer(flex: 5),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
