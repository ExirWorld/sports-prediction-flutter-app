import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/locator/di/di.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/error_entity.dart';
import 'package:oxir_game/core/resources/entity/success_entity.dart';
import 'package:oxir_game/core/resources/model/error_model.dart';
import 'package:oxir_game/core/resources/model/success_model.dart';
import 'package:oxir_game/features/auth/data/data_source/api_auth.dart';
import 'package:oxir_game/features/auth/data/model/categorys_model.dart';
import 'package:oxir_game/features/auth/data/model/login_user_model.dart';
import 'package:oxir_game/features/auth/data/model/rulls_model.dart';
import 'package:oxir_game/features/auth/data/model/user_info_model.dart';
import 'package:oxir_game/features/auth/domain/entity/categorys_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/login_user_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/rulls_entity.dart';
import 'package:oxir_game/features/auth/domain/entity/user_info_entity.dart';
import 'package:oxir_game/features/auth/domain/repository/auth_repository.dart';

@Singleton(as: AuthRepository, env: [Env.prod])
class AuthRepositoryImpl extends AuthRepository {
  final ApiAuth apiAuth;

  AuthRepositoryImpl(this.apiAuth);
  @override
  Future<DataState<List<CategorysEntity>>> categories() async {
    try {
      Response response = await apiAuth.categories();
      List<CategorysEntity> categorysEntity = List<CategorysEntity>.from(
          response.data.map((model) => CategorysModel.fromJson(model)));
      return DataSuccess(categorysEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> logOut() async {
    try {
      Response response = await apiAuth.logOut();
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<LoginUserEntity>> login2Factor(
      String key, String pair) async {
    try {
      Response response = await apiAuth.login2Factor(key, pair);
      LoginUserEntity loginUserEntity = LoginUserModel.fromJson(response.data);
      return DataSuccess(loginUserEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<LoginUserEntity>> loginFingerPrint(
      String fingerPrint) async {
    try {
      Response response = await apiAuth.loginFingerPrint(fingerPrint);
      LoginUserEntity loginUserEntity = LoginUserModel.fromJson(response.data);
      return DataSuccess(loginUserEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> loginToken() async {
    try {
      Response response = await apiAuth.loginToken();
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<LoginUserEntity>> loginUser(
      String userName, String password) async {
    try {
      Response response = await apiAuth.loginUser(userName, password);
      LoginUserEntity loginUserEntity = LoginUserModel.fromJson(response.data);
      return DataSuccess(loginUserEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> register(
      String mobileNumber,
      String password,
      String storeName,
      String name,
      String fName,
      String referalCode,
      String rullId,
      String categoriesId) async {
    try {
      Response response = await apiAuth.register(mobileNumber, password,
          storeName, name, fName, referalCode, rullId, categoriesId);
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> requestSms(String mobileNumber) async {
    try {
      Response response = await apiAuth.requestSms(mobileNumber);
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<List<RullsEntity>>> rulls(String categoriesRef) async {
    try {
      Response response = await apiAuth.rulls(categoriesRef);
      List<RullsEntity> rullsEntity = List<RullsEntity>.from(
          response.data.map((model) => RullsModel.fromJson(model)));
      return DataSuccess(rullsEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> setIdendity(
      String fingerPrint, String status) async {
    try {
      Response response = await apiAuth.setIdendity(fingerPrint, status);
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> towFactorState(String status) async {
    try {
      Response response = await apiAuth.towFactorState(status);
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<UserInfoEntity>> userInfo() async {
    try {
      Response response = await apiAuth.userInfo();
      UserInfoEntity userInfoEntity = UserInfoModel.fromJson(response.data);
      return DataSuccess(userInfoEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<SuccessEntity>> changePassword(String newPassword) async {
    try {
      Response response = await apiAuth.changePassword(newPassword);
      SuccessEntity successEntity = SuccessModel.fromJson(response.data);
      return DataSuccess(successEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }
}
