import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/cow_logger.dart';
import '../../../services/cow_looger_api.dart';
import '../../../services/network/upload.dart';
import 'cow_logger_controller.dart';

class CowLoggerDetailsController extends GetxController {
  final CowLoggerApiService apiService = CowLoggerApiService();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxString? imagePath = "".obs;
  RxString? name = "".obs;
  RxString? description = "".obs;
  Rx<DateTime> date = DateTime.now().obs;

  Datum? log;

  setUpLog(Datum? log) {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      if (log != null) {
        this.log = log;
        name?.value = log.name;
        description?.value = log.description;
        date?.value = log.date!;
        imagePath?.value = log.image!.url!;
      } else {
        imagePath?.value = "";
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
