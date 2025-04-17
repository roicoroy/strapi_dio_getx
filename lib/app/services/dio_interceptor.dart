import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../const.dart';
import 'get_token_service.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio(BaseOptions(baseUrl: strapiBaseUrl));
  final GetTokenService getTokenService = GetTokenService();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await getTokenService.get();

    if (token != null) {
      options.headers.addAll({
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // await refreshToken();
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }
    handler.next(err);
  }

  Future<Response<dynamic>> refreshToken() async {
    var response = await dio.post(
      "refresh token URL",
      options: Options(
        headers: {"Refresh-Token": "get refresh token from your storage"},
      ),
    );

    if (response.statusCode == 200) {
      // LoginResponse loginResponse = LoginResponse.fromJson(response.data);

      //   await setAuthenticationValuesInMemoryManagement(
      //       accessToken: loginResponse.accessToken,
      //       refreshToken: loginResponse.refreshToken);
    }
    return response;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        // "Authorization": "Bearer ${MemoryManagement.getLoginToken()}",
        // "access-token": "Bearer ${MemoryManagement.getAccessToken()}"
      },
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
