import 'package:get_storage/get_storage.dart';
import 'package:strapi_dio_getx/app/model/user.dart';

class LocalGetStorageService {
  final box = GetStorage('token');

  void storeData() async {
    await box.write('token', '123');
  }

  setupTestData() async {
    await box.write('token', '123');
  }

  Future<String> getToken() async {
    return box.read('token');
  }
  
  Future<User> getStoredUser() async {
    return box.read('user');
  }

  addToken(String token) async {
    box.write('token', token);
  }

  addUser(user) async {
    box.write('user', user.toString());
  }

  Future removeTokenFromGetStorage(String boxName) async {
    return box.remove(boxName);
  }

  clear() async {
    final box = GetStorage('token');
    box.erase();
  }

  Future<bool> isTokenExist() async {
    return box.hasData('token');
  }

  Future logout() async {
    box.remove('token');
    box.remove('user');
  }
}
