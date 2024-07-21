import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/home/domain/entity/home_page_entity.dart';
import 'package:oxir_game/features/home/domain/use_case/home_page_usecase.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageUsecase homePageUsecase;
  HomePageBloc(this.homePageUsecase) : super(HomePageInitial()) {
    on<HomePageStartEvent>(_homePageStartEvent);
  }

  FutureOr<void> _homePageStartEvent(
      HomePageStartEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoading());
    DataState dataState = await homePageUsecase.getHomePage();

    if (dataState is DataSuccess) {
      emit(HomePageCompleted(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(HomePageError(dataState.error!));
    }
  }
}
