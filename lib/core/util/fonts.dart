import 'package:flutter/material.dart';
import 'package:test_x/core/util/apcolors.dart';
import 'package:test_x/core/util/screen_size.dart';

class AppTextStyle {
  final BuildContext context;

  AppTextStyle(this.context);

  TextStyle get title {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.024, // 20
      fontWeight: FontWeight.w700,
      color: APColors.primaryMain,
    );
  }

  /* TextStyle get number {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.030, // 32
      fontWeight: FontWeight.w700,
      color: APColors.whiteApprecio,
    );
  }

  TextStyle get label {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.017, //14
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle get description {
    return _baseTextStyle.copyWith(
        fontSize: ScreenSize.height(context) * 0.019, //16
        fontWeight: FontWeight.w500,
        color: APColors.secondaryDark);
  }

  TextStyle get descriptionPercen {
    return _baseTextStyle.copyWith(
        fontSize: ScreenSize.height(context) * 0.013, //16
        fontWeight: FontWeight.w500,
        color: APColors.secondaryDark);
  }

  TextStyle get descriptionRichText {
    return _baseTextStyle.copyWith(
        fontSize: ScreenSize.height(context) * 0.017, //16
        fontWeight: FontWeight.w500,
        color: APColors.secondaryDark);
  }

  TextStyle get shortDescription {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.014, //12
      fontWeight: FontWeight.w400,
      color: Colors.gray100.withOpacity(0.8),
    );
  }

  TextStyle get registerLabel {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.015, //12
      fontWeight: FontWeight.w400,
      color: APColors.secondaryLight,
    );
  }

  TextStyle get buttonTitle {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.022, //18
      fontWeight: FontWeight.w600,
      color: APColors.whitePure,
    );
  }

  TextStyle get inputText {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.width(context) * 0.045, //18
      fontWeight: FontWeight.w400,
      color: APColors.secondaryDark,
    );
  }*/

  /// BASE
  static const _baseTextStyle = TextStyle(
    color: APColors.primaryMain,
    fontWeight: FontWeight.normal,
  );
}
