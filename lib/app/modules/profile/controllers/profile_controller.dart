import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../model/user.dart';
import '../../../services/api.dart';
import '../../../services/local_get_storage.dart';

class ProfileController extends GetxController {
  Rxn<User> user = Rxn<User>();
  Rxn<String> profileImg = Rxn<String>();
  final LocalGetStorageService storageService = LocalGetStorageService();
  final ApiService apiService = ApiService();
  late dynamic response;

  @override
  void onReady() async {
    super.onReady();
    await getMeProfile();
  }

  Future<User> getMeProfile() async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      String token = await storageService.getToken();
      response = await apiService.getProfile(token: token);
      var userJson = jsonEncode(response.data);
      User model = userFromJson(userJson);
      String imgRewc = response.data['image']['url'];
      user.value = model;
      profileImg.value = imgRewc;
      return model;
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
