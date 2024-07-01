import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/core/extension/context_extension.dart';
import 'package:oxir_game/gen/assets.gen.dart';

Future<dynamic> dialogErrorV1({
  required BuildContext context,
  required String title,
  required String titleButton,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding:
            const EdgeInsets.symmetric(horizontal: horizantal_spacing_4x),
        surfaceTintColor: WHITE_COLOR,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        content: SizedBox(
          height: 220,
          width: context.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Assets.icons.error.svg(height: 100, width: 100),
              NormalText(
                title,
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(vertical_spacing_4x),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ALICE_BLUE_COLOR,
                    border: Border.all(color: DENIM_BLUE_COLOR),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: NormalText(
                    titleButton,
                    textColorInLight: TEXT_LINK_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
