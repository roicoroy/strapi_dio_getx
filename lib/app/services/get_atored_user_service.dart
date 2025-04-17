import 'package:get_storage/get_storage.dart';
import 'package:strapi_dio_getx/app/model/user.dart';

class GetStoredUserService {
  final user = GetStorage('user');

  Future<User> getStoredredUser() async {
    User user = await get();
    return user;
    }

  Future<User> get() async => user.read('user');
}
