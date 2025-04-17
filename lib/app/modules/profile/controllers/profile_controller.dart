import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../model/user.dart';
import '../../../services/network/api.dart';
import '../../../services/get_atored_user_service.dart';
import '../../../services/local_get_storage.dart';

class ProfileController extends GetxController {
  Rxn<User> user = Rxn<User>();
  Rxn<String> profileImg = Rxn<String>();
  final LocalGetStorageService storageService = LocalGetStorageService();
  final ApiService apiService = ApiService();
  final GetStoredUserService storedUserService = GetStoredUserService();
  late Response response;

  @override
  void onInit() async {
    super.onInit();
    var uss = getStoredUser();
    print(uss);
  }

  getStoredUser() {
    var us = storedUserService.user;

    return us;
  }

  // getMeProfile() async {
  //   try {
  //     EasyLoading.show(status: 'Loading...', dismissOnTap: false);
  //     // response = await apiService.getProfile(token: token, userId: us.user?.id);
  //     // var userJson = jsonEncode(response.data);
  //     // User model = User.fromJson(response);
  //     // String imgRewc = response.data['image']['url'];
  //     // user.value = model;
  //     // profileImg.value = imgRewc;
  //     // return model;
  //   } catch (e) {
  //     EasyLoading.showError('Something wrong. Try again!');
  //     debugPrint(e.toString());
  //     rethrow;
  //   } finally {
  //     EasyLoading.dismiss();
  //   }
  // }
}
