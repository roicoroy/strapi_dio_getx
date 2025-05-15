import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../services/network/api.dart';
import '../../../services/local/local_get_storage.dart';
import '../../../model/user.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalGetStorageService storageService = LocalGetStorageService();

  signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      var result = await ApiService().signIn(email: email, password: password);
      if (result.statusCode == 200) {
        String token = result.data['jwt'];
        dynamic us = result.data['user'];
        json.encode(us);
        User loggeedUser = User.fromJson(result.data);
        // user.value = loggeedUser;
        await storageService.addToken(token);
        if (loggeedUser != null) {
          await storageService.addUser(loggeedUser!);
        } else {
          throw Exception('User data is null');
        }
        Get.toNamed(Routes.HOME);
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
