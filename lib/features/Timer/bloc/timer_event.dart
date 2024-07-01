part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {}

class Reset extends TimerEvent {}

class OnTick extends TimerEvent {
  final int duration;

  const OnTick({required this.duration});

  @override
  List<Object> get props => [duration];
}
