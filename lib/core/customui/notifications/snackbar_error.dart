import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/gen/assets.gen.dart';

SnackBar snackBarError(
    {required BuildContext context,
    required String title,
    required String desc}) {
  return SnackBar(
    dismissDirection: DismissDirection.up,
    elevation: 0,
    backgroundColor: Colors.transparent,
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150, left: 10, right: 10),
    behavior: SnackBarBehavior.floating,
    content: Container(
      decoration: BoxDecoration(
        color: const Color(0xffED4C5C),
        borderRadius: BorderRadius.circular(RADIUS_5x),
      ),
      child: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: Assets.images.element.svg()),
          Padding(
            padding: const EdgeInsets.all(padding_Foreign2x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      title,
                      textColorInLight: TEXT_LIGHT_COLOR,
                    ),
                    Assets.icons.close.svg(color: WHITE_COLOR),
                  ],
                ),
                const VerticalSpace(vertical_spacing_1x),
                SmallText(
                  desc,
                  textColorInLight: TEXT_LIGHT_COLOR,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
