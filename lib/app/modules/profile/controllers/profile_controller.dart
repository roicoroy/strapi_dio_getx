import 'dart:io';

import 'package:dio/src/response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/image_upload_response.dart';
import '../../../model/user.dart';
import '../../../services/network/api.dart';
import '../../../services/local/local_get_storage.dart';
import '../../../services/network/upload.dart';

class ProfileController extends GetxController {
  Rxn<User?> user = Rxn<User>();
  Rxn<String> profileImg = Rxn<String>();
  final LocalGetStorageService storageService = LocalGetStorageService();
  final ApiService apiService = ApiService();
  final UploadService uploadApi = UploadService();
  Rxn<XFile> uploadFile = Rxn<XFile>();
  RxString? selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await getMeProfile();
  }

  changeAvatar() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (pickedFile != null) {
        Rxn<XFile> imageFile = Rxn<XFile>(pickedFile);
        uploadFile = imageFile;
        selectedImagePath?.value = pickedFile.path;
        selectedImageSize.value =
            "${((File(selectedImagePath!.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}MB";
      } else {
        Get.snackbar('Error', 'Image Not Selected');
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error', 'change avatat');
    }
  }

  void uploadProfileImage(Rxn<XFile> file) async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      var res = await uploadApi.uploadMediaFile(file);
      ImageUploadResponse updateImageId = ImageUploadResponse.fromJson(
        res.data[0],
      );
      var resA = await uploadApi.updateUserAvatar(
        user.value?.id,
        updateImageId.id,
      );
      if (resA?.statusCode == 200) {
        selectedImagePath?.value = '';
        getMeProfile();
      }
    } catch (e) {
      EasyLoading.showError('Something wrong on uploadImage. Try again!');
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }

  getMeProfile() async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      var response = await apiService.getProfile();
      if (response.statusCode == 200) {
        User profile = User.fromJson(response.data);
        user.value = profile;
        if (profile.image?.url != null) {
          String? imgRewc = profile.image?.url;
          profileImg.value = imgRewc;
        } else {
          EasyLoading.showError('User image is null!');
          throw Exception('User image is null');
        }
      }
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
