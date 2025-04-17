import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/cow_logger.dart';
import '../../../services/cow_looger_api.dart';

class CowLoggerListController extends GetxController {
  RxList<CowLoggerDatum> list = List<CowLoggerDatum>.empty(growable: true).obs;
  final CowLoggerApiService apiService = CowLoggerApiService();


  @override
  void onInit() async {
    super.onInit();
    await getLogs();
  }

  @override
  void onReady() async {
    super.onReady();
    await getLogs();
  }

  void submitForm() async {
    var res = await apiService.saveNewLog();
    await getLogs();
  }

  Future<void> getLogs() async {
    var result = await apiService.getCowLoggers();
    CowLogger test = CowLogger.fromJson(result);
    list.assignAll(test.data);
  }
}
