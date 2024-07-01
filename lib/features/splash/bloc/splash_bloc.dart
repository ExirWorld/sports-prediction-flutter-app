import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/auth/domain/entity/user_info_entity.dart';
import 'package:oxir_game/features/auth/domain/use_case/auth_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthUsecase authUsecase;
  SplashBloc(this.authUsecase) : super(SplashInitial()) {
    on<UserInfoEvent>(_userInfoEvent);
    on<TokenEmptyEvent>(_tokenEmptyEvent);
  }

  FutureOr<void> _userInfoEvent(
      UserInfoEvent event, Emitter<SplashState> emit) async {
    emit(UserInfoLoadingState());
    DataState dataState = await authUsecase.userInfo();

    if (dataState is DataSuccess) {
      emit(UserInfoCompletedState(dataState.data));
    }

    if (dataState is DataFailed) {
      emit(UserInfoErrorState(dataState.error!));
    }
  }

  FutureOr<void> _tokenEmptyEvent(
      TokenEmptyEvent event, Emitter<SplashState> emit) {
    emit(const UserInfoErrorState('نیاز به ورود مجدد'));
  }
}
