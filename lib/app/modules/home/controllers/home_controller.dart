
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../services/local/local_get_storage.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final LocalGetStorageService _localGetStorageService =
      LocalGetStorageService();

  void logout() async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false);
      await _localGetStorageService.logout();
      Get.toNamed(Routes.LOGIN);
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
