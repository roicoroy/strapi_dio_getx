import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/services/api.dart';
import '../../../model/services/local_get_storage.dart';
import '../../../model/user.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final count = 0.obs;
  final LocalGetStorageService storageService = LocalGetStorageService();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void signIn({required String email, required String password}) async {
    try {
      var result = await ApiService().signIn(email: email, password: password);
      if (result.statusCode == 200) {
        String token = result.data['jwt'];
        var userResult = await ApiService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          storageService.addToken(token);
          storageService.addUser(userResult.data);
          Get.toNamed(Routes.HOME);
        }
      }
      // }
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }

  void signOut() async {
    user.value = null;
    storageService.removeTokenFromGetStorage('token');
    storageService.removeTokenFromGetStorage('user');
    Get.toNamed(Routes.AUTH);
  }
}
