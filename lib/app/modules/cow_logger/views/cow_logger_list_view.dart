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
      body: Obx(
        () => Center(
          child: ListView.builder(
            itemCount: controller.list.value.length,
            itemBuilder: (context, index) {
              final item = controller.list.value[index].attributes?.name;
              return ListTile(
                title: Text(item ?? 'fd'),
                onTap: () {
                  Get.toNamed(
                    Routes.COW_LOGGER_DETAILS,
                    arguments: {'log': controller.list.value[index]},
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => {
              Get.toNamed(Routes.COW_LOGGER_DETAILS, arguments: {'log': null}),
            },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
