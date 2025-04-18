import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../model/user.dart';
import '../../../services/network/api.dart';
import '../../../services/get_atored_user_service.dart';
import '../../../services/local_get_storage.dart';

class ProfileController extends GetxController {
  Rxn<User?> user = Rxn<User>();
  Rxn<String> profileImg = Rxn<String>();
  final LocalGetStorageService storageService = LocalGetStorageService();
  final ApiService apiService = ApiService();
  late Response response;

  @override
  void onInit() async {
    super.onInit();
    await getMeProfile();
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
