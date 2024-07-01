import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/text_styles.dart';
import 'package:oxir_game/core/extension/context_extension.dart';

abstract class BaseTextWidget extends StatelessWidget {
  final String data;
  final Color? textColorInDark;
  final Color? textColorInLight;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const BaseTextWidget(
    this.data, {
    this.textColorInDark,
    this.textColorInLight,
    this.maxLines,
    this.decoration,
    super.key,
    this.textAlign,
    this.overflow,
  });

  Color getTextColor(BuildContext context) {
    return context.isDarkBrightness
        ? textColorInDark ?? TEXT_LIGHT_COLOR
        : textColorInLight ?? TEXT_DARK_COLOR;
  }

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}

//VERY SMALL
class VerySmallText extends BaseTextWidget {
  const VerySmallText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.verySmall.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class VerySmallBoldText extends BaseTextWidget {
  const VerySmallBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.verySmallBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

//SMALL
class SmallText extends BaseTextWidget {
  const SmallText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.small.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class SmallBoldText extends BaseTextWidget {
  const SmallBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.smallBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

//NORMAL
class NormalText extends BaseTextWidget {
  const NormalText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.normal.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class NormalBoldText extends BaseTextWidget {
  const NormalBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.normalBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

//LARGE
class LargeText extends BaseTextWidget {
  const LargeText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.large.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class LargeBoldText extends BaseTextWidget {
  const LargeBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.largeBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

//BIG
class BigText extends BaseTextWidget {
  const BigText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.big.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class BigBoldText extends BaseTextWidget {
  const BigBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.bigBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

//HUGE
class HugeText extends BaseTextWidget {
  const HugeText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.huge.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class HugeBoldText extends BaseTextWidget {
  const HugeBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.hugeBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

//VERY HUGE
class VeryHugeText extends BaseTextWidget {
  const VeryHugeText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.veryHuge.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}

class VeryHugeBoldText extends BaseTextWidget {
  const VeryHugeBoldText(
    super.data, {
    super.key,
    super.textColorInDark,
    super.textColorInLight,
    super.maxLines,
    super.decoration,
    super.textAlign,
    super.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      overflow: maxLines == 1 ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyles.veryHugeBold.copyWith(
        color: getTextColor(context),
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}
