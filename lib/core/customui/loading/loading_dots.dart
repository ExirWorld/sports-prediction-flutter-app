import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oxir_game/core/common/colors.dart';

class LoadingDots extends StatelessWidget {
  const LoadingDots({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      size: 15,
      color: DENIM_BLUE_COLOR,
    );
  }
}
