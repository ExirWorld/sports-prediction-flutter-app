part of 'timer_bloc.dart';

class TimerState extends Equatable {
  final int seconds;
  final String timerPresenter;

  const TimerState({
    required this.seconds,
    required this.timerPresenter,
  });

  TimerState copyWith({
    int? seconds,
    String? timerPresenter,
  }) {
    return TimerState(
      seconds: seconds ?? this.seconds,
      timerPresenter: timerPresenter ?? this.timerPresenter,
    );
  }

  @override
  List<Object> get props => [
        seconds,
        timerPresenter,
      ];
}
