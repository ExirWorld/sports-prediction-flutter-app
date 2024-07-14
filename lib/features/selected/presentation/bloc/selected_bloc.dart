import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/selected/domain/entity/add_position_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/room_match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/domain/use_case/selected_usecase.dart';

part 'selected_event.dart';
part 'selected_state.dart';

@injectable
class SelectedBloc extends Bloc<SelectedEvent, SelectedState> {
  final SelectedUsecase selectedUsecase;
  SelectedBloc(this.selectedUsecase) : super(SelectedInitial()) {
    on<GetSportsEvent>(_getSportsEvent);
    on<GetLeaguesEvent>(_getLeaguesEvent);
    on<GetMatchEvent>(_getMatchEvent);
    on<GetRoomMatchEvent>(_getRoomMatchEvent);
    on<AddPositionEvent>(_addPositionEvent);
  }

  FutureOr<void> _getSportsEvent(
      GetSportsEvent event, Emitter<SelectedState> emit) async {
    emit(GetSportsLoading());
    DataState dataState = await selectedUsecase.getSports();

    if (dataState is DataSuccess) {
      emit(GetSportsCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(GetSportsError(dataState.error!));
    }
  }

  FutureOr<void> _getLeaguesEvent(
      GetLeaguesEvent event, Emitter<SelectedState> emit) async {
    emit(GetLeaguesLoading());
    DataState dataState = await selectedUsecase.getLeagues(event.sportRef);

    if (dataState is DataSuccess) {
      emit(GetLeaguesCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(GetLeaguesError(dataState.error!));
    }
  }

  FutureOr<void> _getMatchEvent(
      GetMatchEvent event, Emitter<SelectedState> emit) async {
    emit(GetMatchLoading());
    DataState dataState =
        await selectedUsecase.getMatch(event.sportRef, event.leagueRef);

    if (dataState is DataSuccess) {
      emit(GetMatchCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(GetMatchError(dataState.error!));
    }
  }

  FutureOr<void> _getRoomMatchEvent(
      GetRoomMatchEvent event, Emitter<SelectedState> emit) async {
    emit(GetRoomMatchLoading());
    DataState dataState = await selectedUsecase.getRoomMatch(event.matchRef);

    if (dataState is DataSuccess) {
      emit(GetRoomMatchCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(GetRoomMatchError(dataState.error!));
    }
  }

  FutureOr<void> _addPositionEvent(
      AddPositionEvent event, Emitter<SelectedState> emit) async {
    emit(AddPositionLoading());
    DataState dataState = await selectedUsecase.addPosition(
      sportRef: event.sportRef,
      leagueRef: event.leagueRef,
      matchRef: event.matchRef,
      teamRef: event.teamRef,
      roomRef: event.roomRef,
      roomMatchRef: event.roomMatchRef,
    );

    if (dataState is DataSuccess) {
      emit(AddPositionCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(AddPositionError(dataState.error!));
    }
  }
}
