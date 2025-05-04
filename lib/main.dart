import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/services/dio_interceptor.dart';
import 'app/routes/app_pages.dart';
import 'constants/const.dart';
import 'package:path_provider/path_provider.dart';

import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'theme/theme_services.dart';

final dio = Dio(); // With default `Options`.

configureDio() async {
  dio.options.baseUrl = strapiBaseUrl;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await configureDio();
  await configLoading();
  final document = await getApplicationDocumentsDirectory();
  await GetStorage.init(document.path);
  await GetStorage.init('token');
  await GetStorage.init('user');
  dio.interceptors.add(DioInterceptor());
  // runApp(
  //   GetMaterialApp(
  //     title: "Cow Logger",
  //     initialRoute: AppPages.INITIAL,
  //     getPages: AppPages.routes,
  //     builder: EasyLoading.init(),

  //     debugShowCheckedModeBanner: false,
  //     scrollBehavior: const ScrollBehavior().copyWith(
  //       physics: const BouncingScrollPhysics(),
  //     ),
  //     defaultTransition: Transition.fadeIn,
  //     theme: AppTheme.lightTheme,
  //   ),
  // );
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    print(themeController.theme);
    return ScreenUtilInit(
      designSize: const Size(375, 844),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),

            title: 'Door Hub',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            defaultTransition: Transition.fadeIn,
            theme: AppTheme.lightTheme,

            themeMode: getThemeMode(themeController.theme),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}

configLoading() async {
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
