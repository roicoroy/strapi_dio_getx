import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../services/local_get_storage.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final LocalGetStorageService _localGetStorageService =
      LocalGetStorageService();
  @override
  void onInit() async {
    super.onInit();
  }

  void logout() {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      _localGetStorageService.logout();
      Get.toNamed(Routes.LOGIN);
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
