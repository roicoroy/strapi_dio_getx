import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../model/cow_logger.dart';
import '../../../services/cow_looger_api.dart';

class CowLoggerController extends GetxController {
  RxList<Datum> list = List<Datum>.empty(growable: true).obs;
  final CowLoggerApiService apiService = CowLoggerApiService();

  @override
  void onReady() async {
    super.onReady();
    await getLogs();
  }

  Future<void> getLogs() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      List<Datum> response = await apiService.getCowLoggers();
      list.assignAll(response);
    } catch (e) {
      EasyLoading.showError('Something wrong on getLogs. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
