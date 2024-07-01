import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/features/auth/presentation/screen/sms_login/sms_login_screen.dart';

class SmsLoginLink extends StatelessWidget {
  const SmsLoginLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SMSLoginScreen(),
              ));
        },
        child: const NormalText(
          'Log in with a one-time code',
          textColorInLight: TEXT_LINK_COLOR,
        ),
      ),
    );
  }
}
