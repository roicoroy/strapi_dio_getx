import 'package:get/get.dart';

import '../../../model/post.dart';
import '../../../services/api.dart';
import '../../../services/local_get_storage.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final LocalGetStorageService _localGetStorageService =
      LocalGetStorageService();
  final ApiService apiService = ApiService();
  // RxList<Post> posts = <Post>[].obs;
  RxList<Post> posts = List<Post>.empty(growable: true).obs;
  String error = "";
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getData() async {
      dynamic result = await ApiService().getPosts();

      posts.assignAll(postFromJson(result));
      print(posts);
  }

  void logout() {
    _localGetStorageService.logout();
    Get.toNamed(Routes.AUTH);
  }

  void increment() => count.value++;
}
