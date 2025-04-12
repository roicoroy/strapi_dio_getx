import 'package:get/get.dart';

import '../../../model/post.dart';
import '../../../services/api.dart';
import '../../../services/local_get_storage.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final LocalGetStorageService _localGetStorageService =
      LocalGetStorageService();
  final ApiService apiService = ApiService();
  RxList<Post> posts = List<Post>.empty(growable: true).obs;
  String error = "";
  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData() async {
    dynamic result = await ApiService().getPosts();
    posts.assignAll(postFromJson(result));
  }

  void logout() {
    _localGetStorageService.logout();
    Get.toNamed(Routes.LOGIN);
  }
}
