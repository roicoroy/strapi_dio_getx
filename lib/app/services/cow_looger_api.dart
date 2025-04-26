import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:strapi_dio_getx/app/model/cow_logger.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../const.dart';

class CowLoggerApiService {
  var cowUrl = '$baseUrl/api/$cowLoggerEndpoint/?populate=*';
  var postCowUrl = '$baseUrl/api/$cowLoggerEndpoint/?populate=*';
  var remoteUrl = '$baseUrl/api/strapi-cruds';
  late Response response;

  Future<List<Datum>> getCowLoggers() async {
    try {
      response = await dio.get(cowUrl);
      CowLogger test = CowLogger.fromJson(response.data);
      return test.data;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<Response> saveNewLog({
    required String name,
    required String description,
    required DateTime postTime,
    String? imageId,
  }) async {
    var postData = {
      "data": {
        "name": name,
        "description": description,
        "image": imageId,
        "date": postTime.toString(),
      },
    };

    Response response = await dio.post(postCowUrl, data: postData);
    return response;
  }

  Future<Response> updateLog({
    required String documentId,
    required String name,
    required String description,
    required DateTime postTime,
    String? imageId,
  }) async {
    print(documentId);
    var postData = {
      "data": {
        "name": name,
        "description": description,
        "image": imageId,
        "date": postTime.toString(),
      },
    };

    Response response = await dio.put(
      "$baseUrl/api/$cowLoggerEndpoint/$documentId",
      data: postData,
    );
    return response;
  }

  Future<dynamic> dioGet() async {
    Response response = await dio.get(remoteUrl);
    return response;
  }
}
