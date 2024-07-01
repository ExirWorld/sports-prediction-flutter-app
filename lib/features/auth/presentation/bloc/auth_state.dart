part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

// // استیت های لاگین کاربر با نام کاربری و رمز عبور
// نام کاربری همون موبایله

final class LoginUserLoadingState extends AuthState {}

final class LoginUserCompletedState extends AuthState {
  final LoginUserEntity loginUserEntity;

  const LoginUserCompletedState(this.loginUserEntity);
}

final class LoginUserErrorState extends AuthState {
  final String errorText;

  const LoginUserErrorState(this.errorText);
}

// استیت های ثبت نام
final class RegisterLoadingState extends AuthState {}

final class RegisterCompletedState extends AuthState {
  final SuccessEntity successEntity;

  const RegisterCompletedState(this.successEntity);
}

final class RegisterErrorState extends AuthState {
  final String errorText;

  const RegisterErrorState(this.errorText);
}

// استیت های دسته بندی کاربران
final class CategoryLoadingState extends AuthState {}

final class CategoryCompletedState extends AuthState {
  final List<CategorysEntity> categorysEntity;

  const CategoryCompletedState(this.categorysEntity);
}

final class CategoryErrorState extends AuthState {
  final String errorText;

  const CategoryErrorState(this.errorText);
}

// استیت های نقش کاربران
final class RullsLoadingState extends AuthState {}

final class RullsCompletedState extends AuthState {
  final List<RullsEntity> rullsEntity;

  const RullsCompletedState(this.rullsEntity);
}

final class RullsErrorState extends AuthState {
  final String errorText;

  const RullsErrorState(this.errorText);
}

// استیت های درخواست کد تایید از طریق پیامک
final class RequestSmsLoadingState extends AuthState {}

final class RequestSmsCompletedState extends AuthState {
  final SuccessEntity successEntity;

  const RequestSmsCompletedState(this.successEntity);
}

final class RequestSmsErrorState extends AuthState {
  final String errorText;

  const RequestSmsErrorState(this.errorText);
}

// استیت های درخواست مجدد کد تایید از طریق پیامک
final class RequestSmsRepeatLoadingState extends AuthState {}

final class RequestSmsRepeatCompletedState extends AuthState {
  final SuccessEntity successEntity;

  const RequestSmsRepeatCompletedState(this.successEntity);
}

final class RequestSmsRepeatErrorState extends AuthState {
  final String errorText;

  const RequestSmsRepeatErrorState(this.errorText);
}

// استیت های ورود دو مرحله ای کاربر
final class Login2FactorLoadingState extends AuthState {}

final class Login2FactorCompletedState extends AuthState {
  final LoginUserEntity loginUserEntity;

  const Login2FactorCompletedState(this.loginUserEntity);
}

final class Login2FactorErrorState extends AuthState {
  final String errorText;

  const Login2FactorErrorState(this.errorText);
}

// استیت های ورود دو مرحله ای کاربر
final class ChangePasswordLoadingState extends AuthState {}

final class ChangePasswordCompletedState extends AuthState {
  final SuccessEntity successEntity;

  const ChangePasswordCompletedState(this.successEntity);
}

final class ChangePasswordErrorState extends AuthState {
  final String errorText;

  const ChangePasswordErrorState(this.errorText);
}
