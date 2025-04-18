import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../../const.dart';
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

  Future<Response> uploadMediaFile(Rxn<XFile> file) async {
    // String fileName = file.value.path?.split('/');
    final formData = FormData.fromMap({
      'files': [
        await MultipartFile.fromFile(
          file.value!.path,
          filename: 'test',
          contentType: MediaType("image", "jpg"),
        ),
      ],
    });
    response = await dio.post('$baseUrl/api/upload', data: formData);
    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to upload media file');
    }
  }
}
