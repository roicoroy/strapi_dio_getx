import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_list_controller.dart';

class CowLoggerListView extends GetView<CowLoggerListController> {
  CowLoggerListView({super.key});
  @override
  CowLoggerListController get controller => Get.find<CowLoggerListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CowLoggerListView'), centerTitle: true),
      body: Text(
        'CowLoggerListView is working $controller',
        style: TextStyle(fontSize: 20),
      ),
      // body: Obx(
      //   () => Center(
      //     child: ElevatedButton(
      //       onPressed:
      //           () => {
      //             Get.toNamed(
      //               Routes.COW_LOGGER_DETAILS,
      //               arguments: {'id': '123'},
      //             ),
      //           },
      //       child: Text('Cow Logger details'),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => {
              Get.toNamed(Routes.COW_LOGGER_DETAILS, arguments: {'id': null}),
            },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
