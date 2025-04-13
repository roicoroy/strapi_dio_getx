import 'dart:convert';

import 'package:get/get.dart';
import '../../../model/cows.dart';
import '../../../services/cow_looger_api.dart';

class CowLoggerListController extends GetxController {
  Iterable<dynamic> loggers = List<dynamic>.empty(growable: true).obs;
  RxList<dynamic> list = List<dynamic>.empty(growable: true).obs;
  final CowLoggerApiService apiService = CowLoggerApiService();

  @override
  void onInit() async {
    super.onInit();
    // var myData = await apiService.getCowLoggers();
    dynamic result = await apiService.getCowLoggers();
    // loggers.value = myData['data'];
    // var josTr = jsonEncode(result['data']);

    var rest = Cow.cowFromJson(result['data']);
    
    // var myRes = cowLoggerToJson(myData);
    // loggersx.value = cowLoggerFromJson(josTr);
    // list.assignAll(cowListFromJson(rest.toString()));
    // loggers.toList();

    print(rest);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
