part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class UserInfoLoadingState extends SplashState {}

final class UserInfoCompletedState extends SplashState {
  final UserInfoEntity userInfoEntity;

  const UserInfoCompletedState(this.userInfoEntity);
}

final class UserInfoErrorState extends SplashState {
  final String errorText;

  const UserInfoErrorState(this.errorText);
}
