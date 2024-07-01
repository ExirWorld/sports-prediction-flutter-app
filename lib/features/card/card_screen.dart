import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/text_widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SmallText('Cart'),
      ),
    );
  }
}
