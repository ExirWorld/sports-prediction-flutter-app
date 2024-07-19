import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/friends/domain/entity/friends_entity.dart';
import 'package:oxir_game/features/friends/domain/use_case/friends_usecase.dart';

part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final FriendsUsecase friendsUsecase;
  FriendsBloc(this.friendsUsecase) : super(FriendsInitial()) {
    on<FriendsStartEvent>(_friendsStartEvent);
  }

  FutureOr<void> _friendsStartEvent(
      FriendsStartEvent event, Emitter<FriendsState> emit) async {
    emit(FriendsLoading());
    DataState dataState = await friendsUsecase.getfriends();

    if (dataState is DataSuccess) {
      emit(FriendsCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(FriendsError(dataState.error!));
    }
  }
}
