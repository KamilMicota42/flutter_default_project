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

  Future<Result<List<UserDto>, Exception>> getUser() async {
    final result = await _apiService.get(Config.userUri);
    if (result is Exception) {
      return Failure((result as DioException));
    }

    final response = (result as Success).value;
    final data = response.data as List<dynamic>;
    final users = data.map((e) => UserDto.fromJson(e)).toList();
    return Success(users);
  }
}
