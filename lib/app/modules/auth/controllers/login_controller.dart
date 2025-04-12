import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../services/api.dart';
import '../../../services/local_get_storage.dart';
import '../../../model/user.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalGetStorageService storageService = LocalGetStorageService();

  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
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
