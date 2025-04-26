import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/cow_logger.dart';
import '../../../model/image_upload_response.dart';
import '../../../routes/app_pages.dart';
import '../../../services/cow_looger_api.dart';
import '../../../services/network/upload.dart';
import 'cow_logger_controller.dart';

class CowLoggerDetailsController extends GetxController {
  final CowLoggerApiService apiService = CowLoggerApiService();
  final CowLoggerController cowLoggerController = CowLoggerController();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  final UploadService uploadApi = UploadService();
  late Rxn<XFile>? uploadFile = null;
  RxString? selectedImagePath = "".obs;
  RxString? remoteImagePath = "".obs;
  RxString? selectedImageSize = "".obs;
  RxBool? isEdit = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  Datum? log;
  //

  @override
  void onClose() {
    name.dispose();
    description.dispose();
    date.dispose();
    remoteImagePath?.value = "";
    selectedImagePath?.value = "";
  }

  setUpLog(Datum? log) {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      this.log = log;
      if (log?.id != null) {
        isEdit?.value = true;
        name = TextEditingController(text: log?.name);
        description = TextEditingController(text: log?.description.toString());
        if (log?.image?.url != null) {
          remoteImagePath?.value = log!.image!.url!;
          selectedImagePath?.value = "";
        }
      } else {
        name = TextEditingController(text: 'test name');
        description = TextEditingController(text: 'test desc');
        remoteImagePath?.value = "";
        selectedImagePath?.value = "";
        uploadFile!.value = null;
        isEdit?.value = false;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<dynamic> updateLog() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: true);
    try {
      DateTime postTime = selectedDate.value;
      dynamic res;
      if (uploadFile == null) {
        res = await apiService.updateLog(
          documentId: log!.documentId.toString(),
          name: name.text,
          description: description.text,
          postTime: postTime,
          imageId: null,
        );
        await cowLoggerController.getLogsNoLoading();
        snackMessageNavigate(res);
      } else if (uploadFile!.value!.path.isNotEmpty) {
        var uploadRes = await uploadApi.uploadMediaFile(uploadFile!);
        ImageUploadResponse updateImageId = ImageUploadResponse.fromJson(
          uploadRes.data[0],
        );
        res = await apiService.updateLog(
          documentId: log!.documentId.toString(),
          name: name.text,
          description: description.text,
          postTime: postTime,
          imageId: updateImageId.id.toString(),
        );
        snackMessageNavigate(res);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void saveNewLog() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: true);
    try {
      DateTime postTime = selectedDate.value;
      dynamic res;
      if (uploadFile == null) {
        Get.snackbar('Error', 'Add an image, please.');
        // res = await apiService.saveNewLog(
        //   name: name.text,
        //   description: description.text,
        //   postTime: postTime,
        //   imageId: null,
        // );
        // snackMessageNavigate(res);
      } else if (uploadFile!.value!.path.isNotEmpty) {
        var uploadRes = await uploadApi.uploadMediaFile(uploadFile!);
        // ImageUploadResponse updateImageId = ImageUploadResponse.fromJson(
        //   uploadRes.data[0],
        // );
        // res = await apiService.saveNewLog(
        //   name: name.text,
        //   description: description.text,
        //   postTime: postTime,
        //   imageId: updateImageId.id.toString(),
        // );
        // snackMessageNavigate(res);

        // DateTime postTime = selectedDate.value;
        // if (uploadFile!.value!.path.isNotEmpty) {
        //   var uploadRes = await uploadApi.uploadMediaFile(uploadFile!);
        //   ImageUploadResponse updateImageId = ImageUploadResponse.fromJson(
        //     uploadRes.data[0],
        //   );
        //   dynamic res = await apiService.saveNewLog(
        //     name: name.text,
        //     description: description.text,
        //     postTime: postTime,
        //     imageId: updateImageId.id.toString(),
        //   );
        //   snackMessageNavigate(res);
      } 
      // else {
      //   Get.snackbar('Error', 'Add an image, please.');
      // }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  snackMessageNavigate(dynamic res) async {
    res.statusCode == 200
        ? {
          Get.toNamed(Routes.COW_LOGGER, arguments: {'loadLogs': false}),
          Get.snackbar(
            'Success',
            'Log Created Successfully',
            snackPosition: SnackPosition.BOTTOM,
          ),
        }
        : Get.snackbar(
          'Error',
          'Failed to create log',
          snackPosition: SnackPosition.BOTTOM,
        );
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
        remoteImagePath?.value = "";
      } else {
        Get.snackbar('Error', 'Image Not Selected');
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
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
