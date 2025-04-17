import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            icon: const Icon(Icons.code),
            onPressed: () {
              Get.toNamed(Routes.COW_LOGGER);
            },
          ),
          IconButton(
            icon: const Icon(Icons.looks_outlined),
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
          ),
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
      body: 
         Center(
          child: Text('Home'),
        ),
      
    );
  }
}
