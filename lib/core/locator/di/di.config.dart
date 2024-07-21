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
import 'package:oxir_game/core/usecase/http_client.dart' as _i27;
import 'package:oxir_game/features/auth/data/data_source/api_auth.dart' as _i5;
import 'package:oxir_game/features/auth/data/repository/auth_repository_impl.dart'
    as _i18;
import 'package:oxir_game/features/auth/domain/repository/auth_repository.dart'
    as _i17;
import 'package:oxir_game/features/auth/domain/use_case/auth_usecase.dart'
    as _i21;
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart'
    as _i25;
import 'package:oxir_game/features/friends/data/data_source/api_friends.dart'
    as _i6;
import 'package:oxir_game/features/friends/data/repository/friends_repository_impl.dart'
    as _i10;
import 'package:oxir_game/features/friends/domain/repository/friends_repository.dart'
    as _i9;
import 'package:oxir_game/features/friends/domain/use_case/friends_usecase.dart'
    as _i20;
import 'package:oxir_game/features/friends/presentation/bloc/friends_bloc.dart'
    as _i22;
import 'package:oxir_game/features/home/data/data_source/api_home_page.dart'
    as _i7;
import 'package:oxir_game/features/home/data/repository/home_page_repository_impl.dart'
    as _i13;
import 'package:oxir_game/features/home/domain/repository/home_page_repository.dart'
    as _i12;
import 'package:oxir_game/features/home/domain/use_case/home_page_usecase.dart'
    as _i14;
import 'package:oxir_game/features/home/presentation/bloc/home_page_bloc.dart'
    as _i19;
import 'package:oxir_game/features/selected/data/data_source/api_selected.dart'
    as _i8;
import 'package:oxir_game/features/selected/data/repository/selected_repository.impl.dart'
    as _i16;
import 'package:oxir_game/features/selected/domain/repository/selected_repository.dart'
    as _i15;
import 'package:oxir_game/features/selected/domain/use_case/selected_usecase.dart'
    as _i23;
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart'
    as _i24;
import 'package:oxir_game/features/splash/bloc/splash_bloc.dart' as _i26;
import 'package:oxir_game/features/Timer/bloc/timer_bloc.dart' as _i11;
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
    gh.singleton<_i7.ApiHomePage>(() => _i7.ApiHomePage(gh<_i3.Dio>()));
    gh.singleton<_i8.ApiSelected>(() => _i8.ApiSelected(gh<_i3.Dio>()));
    gh.singleton<_i9.FriendsRepository>(
      () => _i10.FriendsRepositoryImpl(gh<_i6.ApiFriends>()),
      registerFor: {_prod},
    );
    gh.factory<_i11.TimerBloc>(() => _i11.TimerBloc(gh<_i4.Ticker>()));
    gh.singleton<_i12.HomePageRepository>(
      () => _i13.HomePageRepositoryImpl(gh<_i7.ApiHomePage>()),
      registerFor: {_prod},
    );
    gh.singleton<_i14.HomePageUsecase>(
        () => _i14.HomePageUsecase(gh<_i12.HomePageRepository>()));
    gh.singleton<_i15.SelectedRepository>(
      () => _i16.SelectedRepositoryImpl(gh<_i8.ApiSelected>()),
      registerFor: {_prod},
    );
    gh.singleton<_i17.AuthRepository>(
      () => _i18.AuthRepositoryImpl(gh<_i5.ApiAuth>()),
      registerFor: {_prod},
    );
    gh.factory<_i19.HomePageBloc>(
        () => _i19.HomePageBloc(gh<_i14.HomePageUsecase>()));
    gh.singleton<_i20.FriendsUsecase>(
        () => _i20.FriendsUsecase(gh<_i9.FriendsRepository>()));
    gh.singleton<_i21.AuthUsecase>(
        () => _i21.AuthUsecase(gh<_i17.AuthRepository>()));
    gh.factory<_i22.FriendsBloc>(
        () => _i22.FriendsBloc(gh<_i20.FriendsUsecase>()));
    gh.singleton<_i23.SelectedUsecase>(
        () => _i23.SelectedUsecase(gh<_i15.SelectedRepository>()));
    gh.factory<_i24.SelectedBloc>(
        () => _i24.SelectedBloc(gh<_i23.SelectedUsecase>()));
    gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(gh<_i21.AuthUsecase>()));
    gh.factory<_i26.SplashBloc>(() => _i26.SplashBloc(gh<_i21.AuthUsecase>()));
    return this;
  }
}

class _$DioProvider extends _i27.DioProvider {}
