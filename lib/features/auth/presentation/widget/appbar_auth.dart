import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/features/root/presentation/root_screen.dart';
import 'package:oxir_game/gen/assets.gen.dart';

AppBar appBarAuth(BuildContext context, bool isTitile, {String? title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: WHITE_COLOR,
    automaticallyImplyLeading: false,
    title: isTitile
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HugeBoldText(
                title!,
                textColorInLight: TEXT_LINK_COLOR,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootScreen(),
                        ));
                  },
                  child: Assets.icons.close.svg()),
            ],
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RootScreen(),
                      ));
                },
                child: Assets.icons.close.svg()),
          ),
  );
}
