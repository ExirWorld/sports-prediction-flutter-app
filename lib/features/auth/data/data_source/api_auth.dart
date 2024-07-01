import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_key.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_service.dart';

@singleton
class ApiAuth {
  final Dio httpclient;

  ApiAuth(this.httpclient);

  // ثبت نام
  Future<dynamic> register(
    String mobileNumber,
    String password,
    String storeName,
    String name,
    String fName,
    String referalCode,
    String rullId,
    String categoriesId,
  ) async {
    final resposne = await httpclient.post('login/Register', data: {
      "password": password,
      "mobileNumber": mobileNumber,
      "storeName": storeName,
      "name": name,
      "fName": fName,
      "referalCode": referalCode,
      "rullId": rullId,
      "categoriesId": categoriesId,
    });
    return resposne;
  }

  // ثبت اثرانگشت
  Future<dynamic> setIdendity(String fingerPrint, String status) async {
    final resposne = await httpclient.post('login/Register', data: {
      "fingerPrint": fingerPrint,
      "status": status,
    });
    return resposne;
  }

  // دریافت اطلاعات کاربر
  Future<dynamic> userInfo() async {
    final resposne = await httpclient.post('login/UserInfo');
    return resposne;
  }

  // لیست دسته بندی کاربران
  Future<dynamic> categories() async {
    final resposne = await httpclient.post('login/Categories');
    return resposne;
  }

  // لیست نقش کاربران بر اساس دسته بندی
  Future<dynamic> rulls(String categoriesRef) async {
    final resposne = await httpclient.post('login/Rulls', data: {
      "CategoriesRef": categoriesRef,
    });
    return resposne;
  }

  // لاگین کاربر با نام کاربری و رمز عبور
  // نام کاربری همون موبایله
  Future<dynamic> loginUser(String userName, String password) async {
    final resposne = await httpclient.post('login/LoginUser', data: {
      "userName": userName,
      "password": password,
    });
    return resposne;
  }

  // ورود دو مرحله ای کاربر
  Future<dynamic> login2Factor(String key, String pair) async {
    final resposne = await httpclient.post('login/Login2Factor', data: {
      "key": key,
      "pair": pair,
    });
    return resposne;
  }

  // درخواست کد تایید از طریق پیامک
  Future<dynamic> requestSms(String mobileNumber) async {
    final resposne = await httpclient.post('login/RequestSms', data: {
      "MobileNumber": mobileNumber,
    });
    return resposne;
  }

  // لاگین با اثرانگشت
  Future<dynamic> loginFingerPrint(String fingerPrint) async {
    final resposne = await httpclient.post('login/LoginFingerPrint', data: {
      "FingerPrint": fingerPrint,
    });
    return resposne;
  }

  // جهت بررسی معتبر بودن توکن
  Future<dynamic> loginToken() async {
    final resposne = await httpclient.post('login/LoginToken');
    return resposne;
  }

  // جهت بررسی معتبر بودن توکن
  Future<dynamic> logOut() async {
    final resposne = await httpclient.post('login/LogOut');
    return resposne;
  }

  // تغییر رمز عبور کاربر
  Future<dynamic> changePassword(String newPassword) async {
    PrefService prefService = PrefService();
    final tokenTemp = await prefService.readCacheString(SharedKey.jwtTokenTemp);
    final resposne = await httpclient.post('login/ChangePassword',
        data: {
          "newPassword": newPassword,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $tokenTemp',
        }));
    return resposne;
  }

  // فعال سازی یا غیر فعال سازی ورود دو مرحله ای
  Future<dynamic> towFactorState(String status) async {
    final resposne = await httpclient.post('login/TowFactorState', data: {
      "status": status,
    });
    return resposne;
  }
}
