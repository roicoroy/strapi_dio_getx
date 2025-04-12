import 'package:get/get.dart';
import 'package:strapi_dio_getx/app/model/services/local_get_storage.dart';

import '../../../model/services/is_loggedIn_service.dart';
import '../../../routes/app_pages.dart';

class RootController extends GetxController {
  final IsLoggedInService _localIsLoggedInService = IsLoggedInService();

  Future<void> isLoggedIn() async {
    bool isLogg = await _localIsLoggedInService.isLoggedIn();
    if (isLogg) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.AUTH);
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await isLoggedIn();
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
