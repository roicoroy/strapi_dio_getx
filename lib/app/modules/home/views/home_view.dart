import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../model/post.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.logout();
            },
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        // final HomeController controller = Get.find<HomeController>();
        return Center(
          child: ListView.builder(
            itemCount: controller.posts.value.length,
            itemBuilder: (context, index) {
              final item = controller.posts.value[index].title;
              return ListTile(
                title: Text(item),
                onTap: () {
                  // Get.toNamed(Routes.POST, arguments: controller.posts.value[index]);
                },
              );
            },
          ),
        );
      }),
    );
  }
}
