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

class CowLoggerDetailsController extends GetxController {
  final CowLoggerApiService apiService = CowLoggerApiService();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  final UploadService uploadApi = UploadService();
  late Rxn<XFile> uploadFile;
  RxString? selectedImagePath = "".obs;
  RxString? remoteImagePath = "".obs;
  RxString? selectedImageSize = "".obs;
  RxBool? isEdit = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  Datum? log;

  @override
  void onReady() async {
    super.onReady();
  }

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
        name = TextEditingController(text: log?.name);
        description = TextEditingController(text: log?.description);
        if (log?.image?.url != null) {
          remoteImagePath?.value = log!.image!.url!;
          selectedImagePath?.value = "";
        }
      } else {
        name = TextEditingController(text: 'test name');
        description = TextEditingController(text: 'test desc');
        remoteImagePath?.value = "";
        selectedImagePath?.value = "";
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<dynamic> updateLog() async {
    DateTime postTime = selectedDate.value;
    if (uploadFile.value!.name.isNotEmpty) {}
    var postData = {
      name: name.text,
      description: description.text,
      postTime: postTime,
      // imageId: updateImageId.id.toString(),
    };
    var res = await apiService.updateLog(
      documentId: log!.documentId.toString(),
      name: name.text,
      description: description.text,
      postTime: postTime,
    );
    if (res.statusCode == 200) {
      Get.snackbar('Success', 'Log Updated Successfully');
    } else {
      Get.snackbar('Error', 'Failed to update log');
    }
    return res;
  }

  void saveNewLog() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      DateTime postTime = selectedDate.value;
      if (uploadFile.value!.path.isNotEmpty) {
        var uploadRes = await uploadApi.uploadMediaFile(uploadFile);
        ImageUploadResponse updateImageId = ImageUploadResponse.fromJson(
          uploadRes.data[0],
        );
        var res = await apiService.saveNewLog(
          name: name.text,
          description: description.text,
          postTime: postTime,
          imageId: updateImageId.id.toString(),
        );
        res.statusCode == 200
            ? Get.snackbar('Success', 'Log Created Successfully')
            : Get.snackbar('Error', 'Failed to create log');
      }

      Get.toNamed(Routes.COW_LOGGER);
    } catch (e) {
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  validationCowDetailsView() {

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
