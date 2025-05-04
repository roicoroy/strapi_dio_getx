import 'package:get_storage/get_storage.dart';

class GetTokenService {
  final tokenBox = GetStorage('token');

  Future<String?> getToken() async {
    String? token = await get();
    if(token != null){
      return token;
    } else {
      return null;
    }
  }

  Future<String?> get() async=> tokenBox.read('token');

}