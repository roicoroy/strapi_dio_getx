import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../model/cow_logger.dart' as cow_logger;
import '../controllers/cow_logger_add_controller.dart';

// ignore: must_be_immutable
class CowLoggerAdd extends GetView<CowLoggerAddController> {
  var cowLoggerDetailsFormKey = GlobalKey<FormState>();

  cow_logger.Datum? log = Get.arguments['log'];

  CowLoggerAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Add');
  }
}
