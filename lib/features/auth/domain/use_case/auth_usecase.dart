import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/success_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/categorys_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/login_user_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/rulls_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/user_info_entity.dart';
import 'package:oxir_game/features/auth/domain/repository/auth_repository.dart';

@singleton
class AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecase(this.authRepository);
  // ثبت نام
  Future<DataState<SuccessEntity>> register(
    String mobileNumber,
    String password,
    String storeName,
    String name,
    String fName,
    String referalCode,
    String rullId,
    String categoriesId,
  ) async {
    DataState<SuccessEntity> dataState = await authRepository.register(
        mobileNumber,
        password,
        storeName,
        name,
        fName,
        referalCode,
        rullId,
        categoriesId);
    return dataState;
  }

  // ثبت اثرانگشت
  Future<DataState<SuccessEntity>> setIdendity(
      String fingerPrint, String status) async {
    DataState<SuccessEntity> dataState =
        await authRepository.setIdendity(fingerPrint, status);
    return dataState;
  }

  // دریافت اطلاعات کاربر
  Future<DataState<UserInfoEntity>> userInfo() async {
    DataState<UserInfoEntity> dataState = await authRepository.userInfo();
    return dataState;
  }

  // لیست دسته بندی کاربران
  Future<DataState<List<CategorysEntity>>> categories() async {
    DataState<List<CategorysEntity>> dataState =
        await authRepository.categories();
    return dataState;
  }

  // لیست نقش کاربران بر اساس دسته بندی
  Future<DataState<List<RullsEntity>>> rulls(String categoriesRef) async {
    DataState<List<RullsEntity>> dataState =
        await authRepository.rulls(categoriesRef);
    return dataState;
  }

  // لاگین کاربر با نام کاربری و رمز عبور
  // نام کاربری همون موبایله
  Future<DataState<LoginUserEntity>> loginUser(
      String userName, String password) async {
    DataState<LoginUserEntity> dataState =
        await authRepository.loginUser(userName, password);
    return dataState;
  }

  // ورود دو مرحله ای کاربر
  Future<DataState<LoginUserEntity>> login2Factor(
      String key, String pair) async {
    DataState<LoginUserEntity> dataState =
        await authRepository.login2Factor(key, pair);
    return dataState;
  }

  // درخواست کد تایید از طریق پیامک
  Future<DataState<SuccessEntity>> requestSms(String mobileNumber) async {
    DataState<SuccessEntity> dataState =
        await authRepository.requestSms(mobileNumber);
    return dataState;
  }

  // لاگین با اثرانگشت
  Future<DataState<LoginUserEntity>> loginFingerPrint(
      String fingerPrint) async {
    DataState<LoginUserEntity> dataState =
        await authRepository.loginFingerPrint(fingerPrint);
    return dataState;
  }

  // جهت بررسی معتبر بودن توکن
  Future<DataState<SuccessEntity>> loginToken() async {
    DataState<SuccessEntity> dataState = await authRepository.loginToken();
    return dataState;
  }

  // جهت بررسی معتبر بودن توکن
  Future<DataState<SuccessEntity>> logOut() async {
    DataState<SuccessEntity> dataState = await authRepository.logOut();
    return dataState;
  }

  // تغییر رمز عبور کاربر
  Future<DataState<SuccessEntity>> changePassword(String newPassword) async {
    DataState<SuccessEntity> dataState =
        await authRepository.changePassword(newPassword);
    return dataState;
  }

  // فعال سازی یا غیر فعال سازی ورود دو مرحله ای
  Future<DataState<SuccessEntity>> towFactorState(String status) async {
    DataState<SuccessEntity> dataState =
        await authRepository.towFactorState(status);
    return dataState;
  }
}
