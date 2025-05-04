import 'package:get_storage/get_storage.dart';

class IsLoggedInService {
  final tokenBox = GetStorage('token');

  Future<bool> isLoggedIn() async {
    bool isLoggedIn = false;
    String? token = getToken();
    if(token != null){
      return isLoggedIn = true;
    } else {
      return isLoggedIn = false;
    }
  }

  String? getToken() => tokenBox.read('token');

}