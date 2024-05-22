import 'package:dio/dio.dart';
import 'package:flutter_default_project/utils/global/logger.dart';

import '../../../services/secure_storage_service.dart';
import '../../../settings/injection.dart';

class AppInterceptors extends QueuedInterceptor {
  final Dio dio;
  final secureStorage = getIt<SecureStorageService>();

  AppInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logger.d("http onRequest");
    var accessToken = await secureStorage.getToken();
    options.headers['X-Auth-Token'] = accessToken;

    return handler.next(options);
  }

  @override
  void onError(DioException err, handler) async {
    if (err.response?.statusCode == 401) {
      logger.d("http onError");
      var token = await secureStorage.getToken();

      if (token == err.requestOptions.headers['X-Auth-Token']) {
        // HERE WE REFRESH THE TOKEN
        // await LoggedUserService.refreshToken();
        token = await secureStorage.getToken();
      }

      err.requestOptions.headers['X-Auth-Token'] = token;

      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    return handler.next(err);
  }
}
