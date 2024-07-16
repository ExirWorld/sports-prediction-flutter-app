import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/text_widgets.dart';

class CountdownNotifier extends ValueNotifier<String> {
  final int targetTimestamp;
  final int chartCreationTimestamp;
  late Timer _timer;
  late Duration initialDifference;

  CountdownNotifier(this.targetTimestamp, this.chartCreationTimestamp)
      : super('') {
    initialDifference =
        DateTime.fromMillisecondsSinceEpoch(targetTimestamp * 1000, isUtc: true)
            .difference(DateTime.fromMillisecondsSinceEpoch(
                chartCreationTimestamp * 1000,
                isUtc: true));
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
      value = '0 days 0 hours 0 minutes And 0 seconds';
      _timer.cancel();
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
    _timer.cancel();
    super.dispose();
  }
}

class CountdownWidget extends StatefulWidget {
  final int targetTimestamp;
  final int chartCreationTimestamp;

  const CountdownWidget({
    Key? key,
    required this.targetTimestamp,
    required this.chartCreationTimestamp,
  }) : super(key: key);

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late CountdownNotifier _countdownNotifier;

  @override
  void initState() {
    super.initState();
    _countdownNotifier = CountdownNotifier(
        widget.targetTimestamp, widget.chartCreationTimestamp);
  }

  @override
  void dispose() {
    _countdownNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _countdownNotifier,
      builder: (context, value, child) {
        double remainingPercentage =
            _countdownNotifier.getRemainingPercentage();
        Color remainingColor = Colors.white24;
        Color passedColor = Colors.yellow[700]!;
        return Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: _createChartData(
                    remainingPercentage,
                    remainingColor,
                    passedColor,
                  ),
                  centerSpaceRadius: 75,
                  startDegreeOffset: -90,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: NormalText(
                    value,
                    textColorInLight: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<PieChartSectionData> _createChartData(
    double remainingPercentage,
    Color remainingColor,
    Color passedColor,
  ) {
    final List<PieChartSectionData> data = [
      PieChartSectionData(
        color: remainingColor,
        value: remainingPercentage * 100,
        radius: 15,
        title: '',
        titlePositionPercentageOffset: 1.3,
        titleStyle: const TextStyle(fontSize: 0),
      ),
      PieChartSectionData(
        color: passedColor,
        value: (1 - remainingPercentage) * 100,
        radius: 15,
        title: '',
        titlePositionPercentageOffset: 1.3,
        titleStyle: const TextStyle(fontSize: 0),
      ),
    ];

    return data;
  }
}
