import 'package:get/get.dart';

import '../controllers/cow_logger_add_controller.dart';

class CowLoggerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowLoggerAddController>(() => CowLoggerAddController());
  }
}
