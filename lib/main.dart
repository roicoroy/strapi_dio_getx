import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'app/dio_interceptor.dart';
import 'app/services/dio_interceptor.dart';
import 'app/routes/app_pages.dart';
import 'const.dart';
import 'package:path_provider/path_provider.dart';

import 'theme/app_theme.dart';

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
  configLoading();
  final document = await getApplicationDocumentsDirectory();
  await GetStorage.init(document.path);
  await GetStorage.init('token');
  dio.interceptors.add(DioInterceptor());
  runApp(
    GetMaterialApp(
      title: "Cow Logger",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.dark,
    ),
  );
}

void configLoading(){
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}