import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/text_widgets.dart';

class SMSLoginScreen extends StatelessWidget {
  const SMSLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SmallText('SMS login Screen'),
      ),
    );
  }
}
