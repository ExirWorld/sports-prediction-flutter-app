// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:oxir_game/core/usecase/http_client.dart' as _i12;
import 'package:oxir_game/features/auth/data/data_source/api_auth.dart' as _i5;
import 'package:oxir_game/features/auth/data/repository/auth_repository_impl.dart'
    as _i8;
import 'package:oxir_game/features/auth/domain/repository/auth_repository.dart'
    as _i7;
import 'package:oxir_game/features/auth/domain/use_case/auth_usecase.dart'
    as _i9;
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart'
    as _i10;
import 'package:oxir_game/features/splash/bloc/splash_bloc.dart' as _i11;
import 'package:oxir_game/features/Timer/bloc/timer_bloc.dart' as _i6;
import 'package:oxir_game/features/Timer/ticker.dart' as _i4;

const String _prod = 'prod';

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
    final dioProvider = _$DioProvider();
    gh.factory<_i3.Dio>(() => dioProvider.httpclient);
    gh.factory<_i4.Ticker>(() => _i4.Ticker());
    gh.singleton<_i5.ApiAuth>(() => _i5.ApiAuth(gh<_i3.Dio>()));
    gh.factory<_i6.TimerBloc>(() => _i6.TimerBloc(gh<_i4.Ticker>()));
    gh.singleton<_i7.AuthRepository>(
      () => _i8.AuthRepositoryImpl(gh<_i5.ApiAuth>()),
      registerFor: {_prod},
    );
    gh.singleton<_i9.AuthUsecase>(
        () => _i9.AuthUsecase(gh<_i7.AuthRepository>()));
    gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(gh<_i9.AuthUsecase>()));
    gh.factory<_i11.SplashBloc>(() => _i11.SplashBloc(gh<_i9.AuthUsecase>()));
    return this;
  }
}

class _$DioProvider extends _i12.DioProvider {}
