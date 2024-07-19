part of 'friends_bloc.dart';

sealed class FriendsState extends Equatable {
  const FriendsState();

  @override
  List<Object> get props => [];
}

final class FriendsInitial extends FriendsState {}

final class FriendsLoading extends FriendsState {}

final class FriendsCompleted extends FriendsState {
  final FriendsEntity friendsEntity;

  const FriendsCompleted(this.friendsEntity);
}

final class FriendsError extends FriendsState {
  final String errorText;

  const FriendsError(this.errorText);
}
