part of 'selected_bloc.dart';

sealed class SelectedEvent extends Equatable {
  const SelectedEvent();

  @override
  List<Object> get props => [];
}

final class GetSportsEvent extends SelectedEvent {}

final class GetLeaguesEvent extends SelectedEvent {
  final String sportRef;

  const GetLeaguesEvent({required this.sportRef});
}

final class GetMatchEvent extends SelectedEvent {
  final String sportRef;
  final String leagueRef;

  const GetMatchEvent({required this.sportRef, required this.leagueRef});
}

final class GetRoomMatchEvent extends SelectedEvent {
  final String matchRef;

  const GetRoomMatchEvent({required this.matchRef});
}

final class AddPositionEvent extends SelectedEvent {
  final String sportRef;
  final String leagueRef;
  final String matchRef;
  final String teamRef;
  final String roomRef;
  final String roomMatchRef;
  const AddPositionEvent({
    required this.sportRef,
    required this.leagueRef,
    required this.matchRef,
    required this.teamRef,
    required this.roomRef,
    required this.roomMatchRef,
  });
}
