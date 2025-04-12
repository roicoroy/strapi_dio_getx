import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:strapi_dio_getx/main.dart';

import '../../const.dart';
import '../model/post.dart';
import '../model/user.dart' show User, UserFromJson, singleUserFromJson;

class ApiService {
  var usersUrl = '$baseUrl/api/$usersEndpoint';
  var postUrl = '$baseUrl/api/$postsEndpoint';
  late dynamic response;

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var body = {"identifier": email, "password": password};

      response = await dio.post(
        '$baseUrl/api/auth/local',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(body),
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> createProfile({
    required String fullName,
    required String token,
  }) async {
    try {
      var body = {"fullName": fullName};
      var response = await dio.post(
        '$baseUrl/api/profile/me',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: jsonEncode(body),
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getProfile({required String token}) async {
    try {
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
    } catch (e) {
      debugPrint(e.toString());
    }
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

  Future<dynamic> getPosts() async {
    try {
      response = await dio.get(postUrl);
      var result = response.data['data'];

      return result;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> signUp({
    required String email,
    required String password,
  }) async {
    try {
      var body = {"username": email, "email": email, "password": password};
      var response = await dio.post(
        '$baseUrl/api/auth/local/register',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(body),
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
