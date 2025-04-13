import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../const.dart';
import '../model/cows.dart';

class CowLoggerApiService {
  var cowUrl = '$baseUrl/api/$cowLoggerEndpoint';
  late Response response;

  getCowLoggers() async {
    try {
      response = await dio.get('$cowUrl?populate=*');
      // var result = response.data['data'];
      var result = response.data;
      // var mtRes = jsonDecode(result);
      // CowLogger cows = CowLogger.fromJson(result);

      return result;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
