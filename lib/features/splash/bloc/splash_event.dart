part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

final class UserInfoEvent extends SplashEvent {}

final class TokenEmptyEvent extends SplashEvent {}
