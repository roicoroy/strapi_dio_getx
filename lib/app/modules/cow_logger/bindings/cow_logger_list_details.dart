import 'package:get/get.dart';

import '../controllers/cow_logger_details_controller.dart';

class CowLoggerDetailsBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<CowLoggerDetailsController>(
      () => CowLoggerDetailsController(),
    );
  }
}
