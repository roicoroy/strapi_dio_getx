import 'package:get_storage/get_storage.dart';

class GetTokenService {
  final tokenBox = GetStorage('token');

  Future<String?> getToken() async {
    String? token = get();
    if(token != null){
      return token;
    } else {
      return null;
    }
  }

  String? get() => tokenBox.read('token');

}