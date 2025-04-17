import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/input_text_button.dart';
import '../../../components/input_text_field.dart';
import '../../../model/cow_logger.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_list_controller.dart';

// ignore: must_be_immutable
class CowLoggerDetailsView extends GetView<CowLoggerListController> {
  CowLoggerDetailsView({super.key});

  CowLoggerDatum? log = Get.arguments['log'];
  TextEditingController name = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (log != null) {
      name = TextEditingController(text: log?.attributes?.name);
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
                const Spacer(),
                const Text(
                  "Strapi,",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  log != null ? 'Edit saved log' : 'Save new log',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
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
                const SizedBox(height: 10),
                const Spacer(),
                InputTextButton(
                  title: "Submit",
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      controller.submitForm();
                      Get.toNamed(Routes.COW_LOGGER);
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
