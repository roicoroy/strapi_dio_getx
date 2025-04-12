import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../../const.dart';
import '../post.dart';
import '../user.dart' show User, UserFromJson, singleUserFromJson;

class ApiService {
  var usersUrl = '$baseUrl/api/$usersEndpoint';
  var postUrl = '$baseUrl/api/$postsEndpoint';
  late dynamic response;

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    var body = {"identifier": email, "password": password};

    response = await dio.post(
      '$baseUrl/api/auth/local',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> createProfile({
    required String fullName,
    required String token,
  }) async {
    var body = {"fullName": fullName};
    var response = await dio.post(
      '$baseUrl/api/profile/me',
      // headers: {
      //   "Content-Type": "application/json",
      //   "Authorization": "Bearer $token"
      // },
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
      data: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> getProfile({required String token}) async {
    var response = await dio.get(
      '$baseUrl/api/profile/me',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    return response;
  }

  Future<List<User>?> getUsers() async {
    try {
      response = await dio.get(usersUrl);
      if (response.statusCode == 200) {
        List<User> model = UserFromJson(response.data.toString());
        return model;
      } else {
        String error = jsonDecode(response.data.toString())['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Adding user
  Future<User?> addUser(String email, String username, String password) async {
    try {
      // var url = Uri.parse(dotenv.get('baseUrl') + dotenv.get('usersEndpoint'));
      // var response = await http.post(
      //   url,
      //   headers: {"Authorization": "Bearer ${dotenv.get('accesToken')}"},
      //   body: {"email": email, "username": username, "password": password},
      // );
      response = await dio.post(
        usersUrl,
        options: Options(headers: {"Authorization": "Bearer $tokenStrapi"}),
        data: {
          {"email": email, "username": username, "password": password},
        },
      );
      if (response.statusCode == 201) {
        User model = singleUserFromJson(response.data.toString());
        return model;
      } else {
        String error = jsonDecode(response.data.toString())['error']['message'];
        throw Exception(error);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Getting posts
  // RxList<Post> getPosts() {
  //   try {
  //     response = dio.get(postUrl);
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //       return response.data;
  //     } else {
  //       throw Exception(
  //         jsonDecode(response.data.toString())["error"]["message"],
  //       );
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<dynamic> getPosts() async {
    dynamic response = await dio.get(postUrl);
    List<Post> postList = [];
    var result =  response.data['data'];
    // var _model = Post.fromJson(response.data['data']);
    // var _model = postFromJson(jsonDecode(response.data)['data']);

    return result;
  }
}
