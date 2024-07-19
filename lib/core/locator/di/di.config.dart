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
import 'package:oxir_game/core/usecase/http_client.dart' as _i21;
import 'package:oxir_game/features/auth/data/data_source/api_auth.dart' as _i5;
import 'package:oxir_game/features/auth/data/repository/auth_repository_impl.dart'
    as _i14;
import 'package:oxir_game/features/auth/domain/repository/auth_repository.dart'
    as _i13;
import 'package:oxir_game/features/auth/domain/use_case/auth_usecase.dart'
    as _i16;
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart'
    as _i19;
import 'package:oxir_game/features/friends/data/data_source/api_friends.dart'
    as _i6;
import 'package:oxir_game/features/friends/data/repository/friends_repository_impl.dart'
    as _i9;
import 'package:oxir_game/features/friends/domain/repository/friends_repository.dart'
    as _i8;
import 'package:oxir_game/features/friends/domain/use_case/friends_usecase.dart'
    as _i15;
import 'package:oxir_game/features/selected/data/data_source/api_selected.dart'
    as _i7;
import 'package:oxir_game/features/selected/data/repository/selected_repository.impl.dart'
    as _i12;
import 'package:oxir_game/features/selected/domain/repository/selected_repository.dart'
    as _i11;
import 'package:oxir_game/features/selected/domain/use_case/selected_usecase.dart'
    as _i17;
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart'
    as _i18;
import 'package:oxir_game/features/splash/bloc/splash_bloc.dart' as _i20;
import 'package:oxir_game/features/Timer/bloc/timer_bloc.dart' as _i10;
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
    gh.singleton<_i6.ApiFriends>(() => _i6.ApiFriends(gh<_i3.Dio>()));
    gh.singleton<_i7.ApiSelected>(() => _i7.ApiSelected(gh<_i3.Dio>()));
    gh.singleton<_i8.FriendsRepository>(
      () => _i9.FriendsRepositoryImpl(gh<_i6.ApiFriends>()),
      registerFor: {_prod},
    );
    gh.factory<_i10.TimerBloc>(() => _i10.TimerBloc(gh<_i4.Ticker>()));
    gh.singleton<_i11.SelectedRepository>(
      () => _i12.SelectedRepositoryImpl(gh<_i7.ApiSelected>()),
      registerFor: {_prod},
    );
    gh.singleton<_i13.AuthRepository>(
      () => _i14.AuthRepositoryImpl(gh<_i5.ApiAuth>()),
      registerFor: {_prod},
    );
    gh.singleton<_i15.FriendsUsecase>(
        () => _i15.FriendsUsecase(gh<_i8.FriendsRepository>()));
    gh.singleton<_i16.AuthUsecase>(
        () => _i16.AuthUsecase(gh<_i13.AuthRepository>()));
    gh.singleton<_i17.SelectedUsecase>(
        () => _i17.SelectedUsecase(gh<_i11.SelectedRepository>()));
    gh.factory<_i18.SelectedBloc>(
        () => _i18.SelectedBloc(gh<_i17.SelectedUsecase>()));
    gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(gh<_i16.AuthUsecase>()));
    gh.factory<_i20.SplashBloc>(() => _i20.SplashBloc(gh<_i16.AuthUsecase>()));
    return this;
  }
}

class _$DioProvider extends _i21.DioProvider {}
