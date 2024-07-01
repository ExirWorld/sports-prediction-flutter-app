import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/extension/timer_extension.dart';
import '../ticker.dart';

part 'timer_event.dart';

part 'timer_state.dart';

@injectable
class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Ticker ticker;
  StreamSubscription? _tickerSubscription;

  TimerBloc(this.ticker)
      : super(TimerState(
          seconds: Constants.OTP_TIMER_SECONDS,
          timerPresenter:
              Constants.OTP_TIMER_SECONDS.toPresenterCountdownTimer(),
        )) {
    on<Start>(_onStart);
    on<Reset>(_onReset);
    on<OnTick>(_onTick);
  }

  _onStart(Start event, Emitter<TimerState> emit) {
    emit(state.copyWith(
      seconds: Constants.OTP_TIMER_SECONDS,
      timerPresenter: Constants.OTP_TIMER_SECONDS.toPresenterCountdownTimer(),
    ));
    _tickerSubscription?.cancel();
    _tickerSubscription =
        ticker.tick(ticks: Constants.OTP_TIMER_SECONDS).listen((duration) {
      add(OnTick(duration: duration));
    });
  }

  _onReset(Reset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    add(Start());
  }

  _onTick(OnTick event, Emitter<TimerState> emit) {
    final duration = event.duration;
    emit(state.copyWith(
      seconds: duration > 0 ? duration : 0,
      timerPresenter: duration.toPresenterCountdownTimer(),
    ));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
