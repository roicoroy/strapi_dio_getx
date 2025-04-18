import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../../const.dart';
import '../../model/user.dart' show User;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadService {
  var usersUrl = '$baseUrl/api/$usersEndpoint';
  var postUrl = '$baseUrl/api/$postsEndpoint';
  late Response response;

  Future<List<dynamic>> getMediaFiles() async {
    try {
      final response = await dio.get('$baseUrl/api/upload/files');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.data);
        return jsonData;
      } else {
        throw Exception('Failed to load media files');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> uploadMediaFile(File file) async {
    String fileName = file.path.split('/').last;
    final formData = FormData.fromMap({
      'files': [
        await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType("image", "jpg"),
        ),
      ],
    });
    final response = await dio.post('$baseUrl/api/upload', data: formData);
    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to upload media file');
    }
  }
}
