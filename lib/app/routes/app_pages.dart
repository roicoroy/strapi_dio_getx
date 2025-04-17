import 'package:get/get.dart';
import 'package:strapi_dio_getx/app/modules/cow_logger/views/cow_logger_details_view.dart';

import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/bindings/register_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/cow_logger/bindings/cow_logger_list_binding.dart';
import '../modules/cow_logger/views/cow_logger_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(name: _Paths.ROOT, page: () => RootView(), binding: RootBinding()),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COW_LOGGER,
      page: () => CowLoggerListView(),
      binding: CowLoggerListBinding(),
    ),
    GetPage(
      name: _Paths.COW_LOGGER_DETAILS,
      page: () => CowLoggerDetailsView(),
      binding: CowLoggerListBinding(),
    ),
  ];
}
