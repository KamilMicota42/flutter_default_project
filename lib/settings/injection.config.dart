// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_default_project/data/remote/repositories/user_repository.dart'
    as _i3;
import 'package:flutter_default_project/data/remote/services/api_service.dart'
    as _i4;
import 'package:flutter_default_project/services/secure_storage_service.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.UserRepository>(() => _i3.UserRepository());
    gh.lazySingleton<_i4.ApiService>(() => _i4.ApiService());
    gh.lazySingleton<_i5.SecureStorageService>(
        () => _i5.SecureStorageService());
    return this;
  }
}
