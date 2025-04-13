import 'package:get/get.dart';

import '../controllers/cow_logger_list_controller.dart';

class CowLoggerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowLoggerListController>(
      () => CowLoggerListController(),
    );
  }
}
