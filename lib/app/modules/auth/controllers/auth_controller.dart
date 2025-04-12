import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../services/api.dart';
import '../../../services/local_get_storage.dart';
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

  void signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      var result = await ApiService().signUp(email: email, password: password);
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await ApiService().createProfile(
          fullName: fullName,
          token: token,
        );
        if (userResult.statusCode == 200) {
          storageService.addToken(token);
          storageService.addUser(userResult.data);
          EasyLoading.showSuccess("Welcome to MyGrocery!");
          Get.toNamed(Routes.HOME);
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      }
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    storageService.removeTokenFromGetStorage('token');
    storageService.removeTokenFromGetStorage('user');
    Get.toNamed(Routes.LOGIN);
  }
}
