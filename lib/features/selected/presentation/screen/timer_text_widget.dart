import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/text_widgets.dart';

class CountdownTextNotifier extends ValueNotifier<String> {
  final int targetTimestamp;
  Timer? _timer;
  late Duration initialDifference;

  CountdownTextNotifier(this.targetTimestamp) : super('') {
    DateTime now = DateTime.now().toUtc();
    initialDifference =
        DateTime.fromMillisecondsSinceEpoch(targetTimestamp * 1000, isUtc: true)
            .difference(now);
    _startCountdown();
  }

  void _startCountdown() {
    _updateTimeRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateTimeRemaining();
    });
  }

  void _updateTimeRemaining() {
    DateTime now = DateTime.now().toUtc();
    DateTime targetDate = DateTime.fromMillisecondsSinceEpoch(
        targetTimestamp * 1000,
        isUtc: true);
    Duration difference = targetDate.difference(now);

    if (difference.isNegative) {
      value = '0d:0h:0m:0s';
      _timer?.cancel();
    } else {
      int days = difference.inDays;
      int hours = difference.inHours % 24;
      int minutes = difference.inMinutes % 60;
      int seconds = difference.inSeconds % 60;
      value = '${days}d : ${hours}h : ${minutes}m : ${seconds}s';
    }
  }

  double getRemainingPercentage() {
    DateTime now = DateTime.now().toUtc();
    DateTime targetDate = DateTime.fromMillisecondsSinceEpoch(
        targetTimestamp * 1000,
        isUtc: true);
    Duration difference = targetDate.difference(now);
    double totalSeconds = initialDifference.inSeconds.toDouble();
    double remainingSeconds = difference.inSeconds.toDouble();
    double remainingPercentage = max(0, remainingSeconds / totalSeconds);
    return remainingPercentage;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class CountdownTextWidget extends StatefulWidget {
  final int targetTimestamp;

  const CountdownTextWidget({
    super.key,
    required this.targetTimestamp,
  });

  @override
  _CountdownTextWidgetState createState() => _CountdownTextWidgetState();
}

class _CountdownTextWidgetState extends State<CountdownTextWidget> {
  late CountdownTextNotifier countdownNotifier;

  @override
  void initState() {
    super.initState();
    countdownNotifier =
        PageStorage.of(context).readState(context) as CountdownTextNotifier? ??
            CountdownTextNotifier(widget.targetTimestamp);
    PageStorage.of(context).writeState(context, countdownNotifier);
  }

  @override
  void dispose() {
    countdownNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: countdownNotifier,
      builder: (context, value, child) {
        return SmallText(
          value,
          textColorInLight: Colors.white,
        );
      },
    );
  }
}
