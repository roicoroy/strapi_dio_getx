import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strapi_dio_getx/app/services/network/upload.dart';

import '../../../services/local_get_storage.dart';
import '../../../routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';

class HomeController extends GetxController {
  final LocalGetStorageService _localGetStorageService =
      LocalGetStorageService();

  final UploadService uploadApi = UploadService();

  late File uploadFile;

  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  void getImage(ImageSource imageSource) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 50,
      );
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        uploadFile = imageFile;
        selectedImagePath.value = pickedFile.path;
        selectedImageSize.value =
            "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}MB";
      } else {
        Get.snackbar('Error', 'Image Not Selected');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<FilePickerResult?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      uploadFile = file;
      selectedImagePath.value = file.path;
      selectedImageSize.value = file.uri.path;
      return result;
    } else {
      Get.snackbar('Error', 'Image Not Selected');
    }
    return null;
  }

  uploadImage(Rxn<XFile> file) async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      await uploadApi.uploadMediaFile(file);
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void logout() async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      await _localGetStorageService.logout();
      Get.toNamed(Routes.LOGIN);
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
