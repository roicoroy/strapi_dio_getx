import 'package:get/get.dart';

import '../controllers/cow_logger_controller.dart';
import '../controllers/cow_logger_details_controller.dart';

class CowLoggerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowLoggerController>(() => CowLoggerController());
    Get.lazyPut<CowLoggerDetailsController>(() => CowLoggerDetailsController());
  }
}
