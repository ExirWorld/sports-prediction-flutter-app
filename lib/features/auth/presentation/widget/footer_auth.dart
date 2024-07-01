import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/core/extension/context_extension.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/register_screen.dart';

class FooterAuth extends StatelessWidget {
  final String title;
  final String titleLink;
  final bool isToRegister;
  const FooterAuth({
    super.key,
    required this.title,
    required this.titleLink,
    required this.isToRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Divider(),
          const VerticalSpace(vertical_spacing_6x),

          // عناوین
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalBoldText(title),
              const HorizontalSpace(horizantal_spacing_1x),
              GestureDetector(
                onTap: () {
                  if (isToRegister) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ));
                  } else if (isToRegister == false) {
                    Navigator.pop(context);
                  }
                },
                child: NormalBoldText(
                  titleLink,
                  textColorInLight: TEXT_LINK_COLOR,
                ),
              ),
            ],
          ),
          const VerticalSpace(vertical_spacing_10x),
        ],
      ),
    );
  }
}
