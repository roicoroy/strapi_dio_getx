import 'package:get/get.dart';

import '../controllers/cow_logger_edit_controller.dart';

class CowLoggerEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowLoggerEditController>(() => CowLoggerEditController());
  }
}
