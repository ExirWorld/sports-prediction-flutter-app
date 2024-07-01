/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/store-scanner-beep-90395.mp3
  String get storeScannerBeep90395 =>
      'assets/audio/store-scanner-beep-90395.mp3';

  /// List of all assets
  List<String> get values => [storeScannerBeep90395];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/account.svg
  SvgGenImage get account => const SvgGenImage('assets/icons/account.svg');

  /// File path: assets/icons/bill.svg
  SvgGenImage get bill => const SvgGenImage('assets/icons/bill.svg');

  /// File path: assets/icons/close.svg
  SvgGenImage get close => const SvgGenImage('assets/icons/close.svg');

  /// File path: assets/icons/commodity.svg
  SvgGenImage get commodity => const SvgGenImage('assets/icons/commodity.svg');

  /// File path: assets/icons/diamond.svg
  SvgGenImage get diamond => const SvgGenImage('assets/icons/diamond.svg');

  /// File path: assets/icons/error.svg
  SvgGenImage get error => const SvgGenImage('assets/icons/error.svg');

  /// File path: assets/icons/finger-print.svg
  SvgGenImage get fingerPrint =>
      const SvgGenImage('assets/icons/finger-print.svg');

  /// File path: assets/icons/gym.svg
  SvgGenImage get gym => const SvgGenImage('assets/icons/gym.svg');

  /// File path: assets/icons/inventory.svg
  SvgGenImage get inventory => const SvgGenImage('assets/icons/inventory.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/message.svg
  SvgGenImage get message => const SvgGenImage('assets/icons/message.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/reports.svg
  SvgGenImage get reports => const SvgGenImage('assets/icons/reports.svg');

  /// File path: assets/icons/sales-box.svg
  SvgGenImage get salesBox => const SvgGenImage('assets/icons/sales-box.svg');

  /// File path: assets/icons/store.svg
  SvgGenImage get store => const SvgGenImage('assets/icons/store.svg');

  /// File path: assets/icons/successful.svg
  SvgGenImage get successful =>
      const SvgGenImage('assets/icons/successful.svg');

  /// File path: assets/icons/support.svg
  SvgGenImage get support => const SvgGenImage('assets/icons/support.svg');

  /// File path: assets/icons/trumpet.svg
  SvgGenImage get trumpet => const SvgGenImage('assets/icons/trumpet.svg');

  /// File path: assets/icons/turnover.svg
  SvgGenImage get turnover => const SvgGenImage('assets/icons/turnover.svg');

  /// File path: assets/icons/user-login.svg
  SvgGenImage get userLogin => const SvgGenImage('assets/icons/user-login.svg');

  /// File path: assets/icons/user.svg
  SvgGenImage get user => const SvgGenImage('assets/icons/user.svg');

  /// File path: assets/icons/visitor.svg
  SvgGenImage get visitor => const SvgGenImage('assets/icons/visitor.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        account,
        bill,
        close,
        commodity,
        diamond,
        error,
        fingerPrint,
        gym,
        inventory,
        menu,
        message,
        notification,
        reports,
        salesBox,
        store,
        successful,
        support,
        trumpet,
        turnover,
        userLogin,
        user,
        visitor
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/barcode.svg
  SvgGenImage get barcode => const SvgGenImage('assets/images/barcode.svg');

  /// File path: assets/images/change-password.svg
  SvgGenImage get changePassword =>
      const SvgGenImage('assets/images/change-password.svg');

  /// File path: assets/images/element.svg
  SvgGenImage get element => const SvgGenImage('assets/images/element.svg');

  /// File path: assets/images/forgetfulness.svg
  SvgGenImage get forgetfulness =>
      const SvgGenImage('assets/images/forgetfulness.svg');

  /// File path: assets/images/kif.png
  AssetGenImage get kif => const AssetGenImage('assets/images/kif.png');

  /// File path: assets/images/play.svg
  SvgGenImage get play => const SvgGenImage('assets/images/play.svg');

  /// File path: assets/images/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/search.svg');

  /// File path: assets/images/verification-code.svg
  SvgGenImage get verificationCode =>
      const SvgGenImage('assets/images/verification-code.svg');

  /// List of all assets
  List<dynamic> get values => [
        avatar,
        barcode,
        changePassword,
        element,
        forgetfulness,
        kif,
        play,
        search,
        verificationCode
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/fa.json
  String get fa => 'assets/translations/fa.json';

  /// List of all assets
  List<String> get values => [en, fa];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
