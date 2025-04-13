import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/api.dart';
import '../../../services/local_get_storage.dart';

class RegisterController extends GetxController {
  final LocalGetStorageService storageService = LocalGetStorageService();
  final ApiService apiService = ApiService();

  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();



  signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      await EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      var result = await apiService.signUp(email: email, password: password);
      if (result.statusCode == 200) {
        String token = result.data['jwt'];
        storageService.addToken(token);
        var userResult = await ApiService().createProfile(
          fullName: fullName,
          token: token,
        );
        if (userResult.statusCode == 200) {
          storageService.addToken(token);
          storageService.addUser(userResult.data);
          Get.toNamed(Routes.HOME);
        } else {
          EasyLoading.showError('Something went wrong. Try again!');
        }
      }
    } catch (e) {
      EasyLoading.showError('Something went wrong. Try again!');
      debugPrint(e.toString());
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
