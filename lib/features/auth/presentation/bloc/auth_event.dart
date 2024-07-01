part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// ایونت لاگین کاربر با نام کاربری و رمز عبور
// نام کاربری همون موبایله
final class LoginUserEvent extends AuthEvent {
  final String userName;
  final String password;

  const LoginUserEvent({required this.userName, required this.password});
}

// ایونت ثبت نام
final class RegisterEvent extends AuthEvent {
  final String mobileNumber;
  final String password;
  final String storeName;
  final String name;
  final String fName;
  final String referalCode;
  final String rullId;
  final String categoriesId;

  const RegisterEvent({
    required this.mobileNumber,
    required this.password,
    required this.storeName,
    required this.name,
    required this.fName,
    required this.referalCode,
    required this.rullId,
    required this.categoriesId,
  });
}

// ایونت دسته بندی کاربران
final class CategoriesEvent extends AuthEvent {}

// ایونت نقش کاربران
final class RullsEvent extends AuthEvent {
  final String categoriesRef;

  const RullsEvent({required this.categoriesRef});
}

// ایونت درخواست کد تایید از طریق پیامک
final class RequestSmsEvent extends AuthEvent {
  final String mobileNumber;

  const RequestSmsEvent(this.mobileNumber);
}

// ایونت درخواست مجدد کد تایید از طریق پیامک
final class RequestSmsRepeatEvent extends AuthEvent {
  final String mobileNumber;

  const RequestSmsRepeatEvent(this.mobileNumber);
}

// ایونت ورود دو مرحله ای کاربر
final class Login2FactorEvent extends AuthEvent {
  final String key;
  final String pair;

  const Login2FactorEvent({required this.key, required this.pair});
}

// ایونت تغییر رمز عبور کاربر
final class ChangePasswordEvent extends AuthEvent {
  final String newPassword;

  const ChangePasswordEvent({required this.newPassword});
}
