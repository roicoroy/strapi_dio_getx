import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../../cow_logger/views/logger_list.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  bool showCart = false;
  bool showDetails = false;

  double storeHeight = 770;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () {
              // Get.toNamed(Routes.COW_LOGGER);
              Get.toNamed(Routes.COW_LOGGER, arguments: {'loadLogs': true});
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
      // body: LoggerList(),
    );
  }
}
