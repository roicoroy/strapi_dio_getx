import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../model/autheinciated_user.dart';
import '../../../services/network/api.dart';
import '../../../services/local_get_storage.dart';
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
        // String us = result.data['user'];
        User loggeedUser = User.fromJson(result?.data);
        user.value = loggeedUser;
        storageService.addToken(token);
        storageService.addUser(loggeedUser.user);
        Get.toNamed(Routes.HOME);
        // int? userId = loggeedUser.user?.id;
        // var userResult = await ApiService().getProfile(
        //   token: token,
        //   userId: userId,
        // );
        // userResult;
        // if (userResult.statusCode == 200) {
        //   user.value = User.fromJson(userResult.data);
        //   storageService.addToken(token);
        //   storageService.addUser(userResult.data);
        //   Get.toNamed(Routes.HOME);
        // }
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
