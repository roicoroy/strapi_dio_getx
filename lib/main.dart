import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'app/dio_interceptor.dart';
import 'app/dio_interceptor.dart';
import 'app/routes/app_pages.dart';
import 'const.dart';
import 'package:path_provider/path_provider.dart';

final dio = Dio(); // With default `Options`.

void configureDio() {
  // Set default configs
  dio.options.baseUrl = strapiBaseUrl;
  dio.options.connectTimeout = Duration(seconds: 5);
  dio.options.receiveTimeout = Duration(seconds: 3);

  // Or create `Dio` with a `BaseOptions` instance.
  final options = BaseOptions(
    baseUrl: strapiBaseUrl,
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
  final anotherDio = Dio(options);

  // Or clone the existing `Dio` instance with all fields.
  final clonedDio = dio.clone();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDio();
  final document = await getApplicationDocumentsDirectory();
  await GetStorage.init(document.path);
  await GetStorage.init('token');
  dio.interceptors.add(DioInterceptor());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
