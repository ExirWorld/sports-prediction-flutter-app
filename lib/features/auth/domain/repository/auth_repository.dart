import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/success_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/categorys_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/login_user_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/rulls_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/user_info_entity.dart';

abstract class AuthRepository {
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
  );

  // ثبت اثرانگشت
  Future<DataState<SuccessEntity>> setIdendity(
      String fingerPrint, String status);

  // دریافت اطلاعات کاربر
  Future<DataState<UserInfoEntity>> userInfo();

  // لیست دسته بندی کاربران
  Future<DataState<List<CategorysEntity>>> categories();

  // لیست نقش کاربران بر اساس دسته بندی
  Future<DataState<List<RullsEntity>>> rulls(String categoriesRef);

  // لاگین کاربر با نام کاربری و رمز عبور
  // نام کاربری همون موبایله
  Future<DataState<LoginUserEntity>> loginUser(
      String userName, String password);

  // ورود دو مرحله ای کاربر
  Future<DataState<LoginUserEntity>> login2Factor(String key, String pair);

  // درخواست کد تایید از طریق پیامک
  Future<DataState<SuccessEntity>> requestSms(String mobileNumber);

  // لاگین با اثرانگشت
  Future<DataState<LoginUserEntity>> loginFingerPrint(String fingerPrint);

  // جهت بررسی معتبر بودن توکن
  Future<DataState<SuccessEntity>> loginToken();

  // جهت بررسی معتبر بودن توکن
  Future<DataState<SuccessEntity>> logOut();

  // تغییر رمز عبور کاربر
  Future<DataState<SuccessEntity>> changePassword(String newPassword);

  // فعال سازی یا غیر فعال سازی ورود دو مرحله ای
  Future<DataState<SuccessEntity>> towFactorState(String status);
}
