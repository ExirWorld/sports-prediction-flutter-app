import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // عنوان ورود به حساب
        VeryHugeBoldText(
          'Account login',
          textColorInLight: TEXT_LINK_COLOR,
        ),
        VerticalSpace(vertical_spacing_3x),

        // به اکسیر خوش آمدید
        NormalBoldText('Welcome to Oxir!'),
      ],
    );
  }
}
