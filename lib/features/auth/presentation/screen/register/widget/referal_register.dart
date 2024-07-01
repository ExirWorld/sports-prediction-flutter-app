import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';

class ReferalRegisterBox extends StatelessWidget {
  const ReferalRegisterBox({
    super.key,
  });

  static ValueNotifier<bool> checkBoxNotifire = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkBoxNotifire.value = !checkBoxNotifire.value;
      },
      child: ValueListenableBuilder(
        valueListenable: checkBoxNotifire,
        builder: (context, value, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                value
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank_outlined,
                color: DENIM_BLUE_COLOR,
              ),
              const HorizontalSpace(horizantal_spacing_1x),
              const NormalText(
                'Referrer ID (optional)',
                textColorInLight: TEXT_LINK_COLOR,
              ),
            ],
          );
        },
      ),
    );
  }
}
