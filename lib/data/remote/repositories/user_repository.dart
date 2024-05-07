import 'package:dio/dio.dart';
import 'package:flutter_default_project/data/remote/dto/user_dto.dart';
import 'package:flutter_default_project/data/remote/services/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../../settings/injection.dart';
import '../../../settings/result.dart';
import '../config.dart';

@lazySingleton
class UserRepository {
  final _apiService = getIt<ApiService>();

  Future<Result<UserDto, Exception>> getUser() async {
    final result = await _apiService.get(Config.userUri);
    if (result is Exception) {
      return Failure((result as DioException));
    }
    return Success(UserDto.fromJson((result as Success).value.data));
  }
}
