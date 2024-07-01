import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/success_entity.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_key.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_service.dart';
import 'package:oxir_game/features/auth/domain/entity/categorys_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/login_user_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/rulls_entity.dart';
import 'package:oxir_game/features/auth/domain/use_case/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase authUsecase;
  AuthBloc(this.authUsecase) : super(AuthInitial()) {
    on<LoginUserEvent>(_loginUserEvent);
    on<RegisterEvent>(_registerEvent);
    on<CategoriesEvent>(_categoriesEvent);
    on<RullsEvent>(_rullsEvent);
    on<RequestSmsEvent>(_requestSmsEvent);
    on<RequestSmsRepeatEvent>(_requestSmsRepeatEvent);
    on<Login2FactorEvent>(_login2FactorEvent);
    on<ChangePasswordEvent>(_changePasswordEvent);
  }

  // بلاک لاگین کاربر با نام کاربری و رمز عبور
  // نام کاربری همون موبایله
  FutureOr<void> _loginUserEvent(
      LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(LoginUserLoadingState());
    DataState dataState =
        await authUsecase.loginUser(event.userName, event.password);

    if (dataState is DataSuccess) {
      LoginUserEntity loginUserEntity = dataState.data;
      PrefService prefService = PrefService();
      prefService.createCacheString(SharedKey.jwtToken, loginUserEntity.token!);
      emit(LoginUserCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(LoginUserErrorState(dataState.error!));
    }
  }

  // بلاک ثبت نام
  FutureOr<void> _registerEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    DataState dataState = await authUsecase.register(
      event.mobileNumber,
      event.password,
      event.storeName,
      event.name,
      event.fName,
      event.referalCode,
      event.rullId,
      event.categoriesId,
    );

    if (dataState is DataSuccess) {
      emit(RegisterCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(RegisterErrorState(dataState.error!));
    }
  }

  // بلاک دسته بندی کاربران
  FutureOr<void> _categoriesEvent(
      CategoriesEvent event, Emitter<AuthState> emit) async {
    emit(CategoryLoadingState());
    DataState dataState = await authUsecase.categories();

    if (dataState is DataSuccess) {
      emit(CategoryCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(CategoryErrorState(dataState.error!));
    }
  }

  // بلاک نقش کاربران
  FutureOr<void> _rullsEvent(RullsEvent event, Emitter<AuthState> emit) async {
    emit(RullsLoadingState());
    DataState dataState = await authUsecase.rulls(event.categoriesRef);

    if (dataState is DataSuccess) {
      emit(RullsCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(RullsErrorState(dataState.error!));
    }
  }

  // بلاک درخواست کد تایید از طریق پیامک
  FutureOr<void> _requestSmsEvent(
      RequestSmsEvent event, Emitter<AuthState> emit) async {
    emit(RequestSmsLoadingState());
    DataState dataState = await authUsecase.requestSms(event.mobileNumber);

    if (dataState is DataSuccess) {
      emit(RequestSmsCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(RequestSmsErrorState(dataState.error!));
    }
  }

  // بلاک ورود دو مرحله ای کاربر
  FutureOr<void> _login2FactorEvent(
      Login2FactorEvent event, Emitter<AuthState> emit) async {
    emit(Login2FactorLoadingState());

    DataState dataState = await authUsecase.login2Factor(event.key, event.pair);

    if (dataState is DataSuccess) {
      emit(Login2FactorCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(Login2FactorErrorState(dataState.error!));
    }
  }

  FutureOr<void> _changePasswordEvent(
      ChangePasswordEvent event, Emitter<AuthState> emit) async {
    emit(ChangePasswordLoadingState());
    DataState dataState = await authUsecase.changePassword(event.newPassword);

    if (dataState is DataSuccess) {
      emit(ChangePasswordCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(ChangePasswordErrorState(dataState.error!));
    }
  }

  // بلاک درخواست مجدد کد تایید از طریق پیامک
  FutureOr<void> _requestSmsRepeatEvent(
      RequestSmsRepeatEvent event, Emitter<AuthState> emit) async {
    emit(RequestSmsRepeatLoadingState());
    DataState dataState = await authUsecase.requestSms(event.mobileNumber);

    if (dataState is DataSuccess) {
      emit(RequestSmsRepeatCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(RequestSmsRepeatErrorState(dataState.error!));
    }
  }
}
