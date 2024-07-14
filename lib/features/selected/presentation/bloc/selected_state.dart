part of 'selected_bloc.dart';

sealed class SelectedState extends Equatable {
  const SelectedState();

  @override
  List<Object> get props => [];
}

final class SelectedInitial extends SelectedState {}

final class GetSportsLoading extends SelectedState {}

final class GetSportsCompleted extends SelectedState {
  final List<SportsEntity> sportsEntity;

  const GetSportsCompleted(this.sportsEntity);
}

final class GetSportsError extends SelectedState {
  final String errorText;

  const GetSportsError(this.errorText);
}

////////////////////////////////////////////////////////////////////////////////////

final class GetLeaguesLoading extends SelectedState {}

final class GetLeaguesCompleted extends SelectedState {
  final List<LeagueEntity> leagueEntity;

  const GetLeaguesCompleted(this.leagueEntity);
}

final class GetLeaguesError extends SelectedState {
  final String errorText;

  const GetLeaguesError(this.errorText);
}

////////////////////////////////////////////////////////////////////////////////////

final class GetMatchLoading extends SelectedState {}

final class GetMatchCompleted extends SelectedState {
  final List<MatchEntity> matchEntity;

  const GetMatchCompleted(this.matchEntity);
}

final class GetMatchError extends SelectedState {
  final String errorText;

  const GetMatchError(this.errorText);
}

////////////////////////////////////////////////////////////////////////////////////
final class GetRoomMatchLoading extends SelectedState {}

final class GetRoomMatchCompleted extends SelectedState {
  final List<RoomMatchEntity> roomMatchEntity;

  const GetRoomMatchCompleted(this.roomMatchEntity);
}

final class GetRoomMatchError extends SelectedState {
  final String errorText;

  const GetRoomMatchError(this.errorText);
}
////////////////////////////////////////////////////////////////////////////////////

final class AddPositionLoading extends SelectedState {}

final class AddPositionCompleted extends SelectedState {
  final List<AddPositionEntity> addPositionEntity;

  const AddPositionCompleted(this.addPositionEntity);
}

final class AddPositionError extends SelectedState {
  final String errorText;

  const AddPositionError(this.errorText);
}
