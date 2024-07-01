import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/auth/presentation/screen/forgot_password/forgot_pass_screen.dart';
import 'package:oxir_game/gen/assets.gen.dart';

class RememberMeAuth extends StatefulWidget {
  const RememberMeAuth({
    super.key,
  });

  @override
  State<RememberMeAuth> createState() => _RememberMeAuthState();
}

class _RememberMeAuthState extends State<RememberMeAuth> {
  bool checkBox = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              checkBox = !checkBox;
            });
          },
          child: Row(
            children: [
              Icon(
                checkBox
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank_outlined,
                color: DENIM_BLUE_COLOR,
              ),
              const HorizontalSpace(horizantal_spacing_2x),
              const NormalText(
                'Remember Me',
                textColorInLight: TEXT_LINK_COLOR,
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPassScreen(),
                ));
          },
          child: Row(
            children: [
              Assets.icons.userLogin.svg(),
              const HorizontalSpace(horizantal_spacing_2x),
              const SmallText(
                "Forget Password",
                textColorInLight: TEXT_LINK_COLOR,
              ),
            ],
          ),
        )
      ],
    );
  }
}
