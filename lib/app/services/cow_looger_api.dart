import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:strapi_dio_getx/app/model/cow_logger.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../const.dart';

class CowLoggerApiService {
  var cowUrl = '$baseUrl/api/$cowLoggerEndpoint/?populate=*';
  var postCowUrl = '$baseUrl/api/$cowLoggerEndpoint';
  var remoteUrl = '$baseUrl/api/strapi-cruds';
  late Response response;

  getCowLoggers() async {
    try {
      response = await dio.get(cowUrl);
      var result = response.data;
      return result;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<Response> saveNewLog() async {
    var postData = {
      "data": {"name": "daniel", "description": "world! fuck man"},
    };

    Response response = await dio.post(postCowUrl, data: postData);
    return response;
  }

  Future<dynamic> dioGet() async {
    Response response = await dio.get(remoteUrl);
    return response;
  }
}
