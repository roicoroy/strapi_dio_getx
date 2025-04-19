import 'dart:convert';
import 'dart:io';

import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/cow_logger.dart';
import '../../../model/image_upload_response.dart';
import '../../../routes/app_pages.dart';
import '../../../services/cow_looger_api.dart';
import '../../../services/network/upload.dart';

class CowLoggerController extends GetxController {
  RxList<Datum> list = List<Datum>.empty(growable: true).obs;
  final CowLoggerApiService apiService = CowLoggerApiService();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  final UploadService uploadApi = UploadService();
  late Rxn<XFile> uploadFile;
  RxString? selectedImagePath = "".obs;
  RxString? selectedImageSize = "".obs;

  @override
  void onReady() async {
    super.onReady();
    await getLogs();
  }

  void submitForm(String name, String description) async {
    DateTime postTime = selectedDate.value;
    if (uploadFile.value!.path.isNotEmpty) {
      var uploadRes = await uploadApi.uploadMediaFile(uploadFile);
      ImageUploadResponse updateImageId = ImageUploadResponse.fromJson(
        uploadRes.data[0],
      );
      var res = await apiService.saveNewLog(
        name: name,
        description: description,
        postTime: postTime,
        imageId: updateImageId.id.toString(),
      );
    }

    await getLogs();
    Get.toNamed(Routes.COW_LOGGER);
  }

  Future<void> getLogs() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      List<Datum> response = await apiService.getCowLoggers();
      list.assignAll(response);
    } catch (e) {
      EasyLoading.showError('Something wrong on getLogs. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getImage(ImageSource imageSource) async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 50,
      );
      if (pickedFile != null) {
        Rxn<XFile> imageFile = Rxn<XFile>(pickedFile);
        uploadFile = imageFile;
        selectedImagePath?.value = pickedFile.path;
        selectedImageSize?.value =
            "${((File(selectedImagePath!.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}MB";
      } else {
        Get.snackbar('Error', 'Image Not Selected');
      }
    } catch (e) {
      EasyLoading.showError('Something wrong on getImage. Try again!');
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: null,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
}
