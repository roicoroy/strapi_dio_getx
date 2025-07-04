import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../model/cow_logger.dart';
import '../../../routes/app_pages.dart';
import '../../../services/cow_looger_api.dart';

class CowLoggerController extends GetxController {
  RxList<Datum> list = List<Datum>.empty(growable: true).obs;
  final CowLoggerApiService apiService = CowLoggerApiService();

  loadLogs(bool? loadLogs) {
    // loadLogs? ? getLogsNoLoading() : getLogs();
    getLogs();
  }

  createNewLog() {
    Get.toNamed(Routes.COW_LOGGER_ADD, arguments: {'log': null});
  }

  getList(RxList<Datum> list) {
    var returnList = list;

    return returnList.toList();
  }

  @override
  void onInit() async {
    super.onInit();
    await getLogs();
  }

  Future<void> getLogsNoLoading() async {
    try {
      List<Datum> response = await apiService.getCowLoggers();
      list.assignAll(response);
      update();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getLogs() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false);
    try {
      List<Datum> response = await apiService.getCowLoggers();
      list.assignAll(response);
      update();
    } catch (e) {
      EasyLoading.showError(e.toString());
      throw Exception(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> deleteLog(String id) async {
    try {
      var res = await apiService.deleteLog(id: id);
      if (res.statusCode == 204) {
        await getLogs();
      }
      // apiService.deleteLog(id: id).then((response) {
      //   getLogs();
      // });
    } catch (e) {
      throw Exception(e);
    }
  }
}
