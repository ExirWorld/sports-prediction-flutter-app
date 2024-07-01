import 'package:flutter/material.dart';

import 'dimens.dart';
import 'fonts.dart';

class TextStyles {
  TextStyles._();

  static const TextStyle defaultStyle = TextStyle(
    height: TEXT_LINE_HEIGHT,
  );

  //VERY SMALL
  static TextStyle verySmall = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_VERY_SMALL,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle verySmallBold = verySmall.copyWith(
    fontFamily: defaultBoldFontName,
  );

  //SMALL
  static TextStyle small = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_SMALL,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle smallBold = small.copyWith(
    fontFamily: defaultBoldFontName,
  );

  //NORMAL
  static TextStyle normal = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_NORMAL,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle normalBold = normal.copyWith(
    fontFamily: defaultBoldFontName,
  );

  //LARGE
  static TextStyle large = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_LARGE,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle largeBold = large.copyWith(
    fontFamily: defaultBoldFontName,
  );

  //BIG
  static TextStyle big = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_BIG,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle bigBold = big.copyWith(
    fontFamily: defaultBoldFontName,
  );

  //HUGE
  static TextStyle huge = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_HUGE,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle hugeBold = huge.copyWith(
    fontFamily: defaultBoldFontName,
  );

  //VERY HUGE
  static TextStyle veryHuge = defaultStyle.copyWith(
    fontSize: TEXT_SIZE_VERY_HUGE,
    fontFamily: defaultRegularFontName,
  );

  static TextStyle veryHugeBold = veryHuge.copyWith(
    fontFamily: defaultBoldFontName,
  );
}
