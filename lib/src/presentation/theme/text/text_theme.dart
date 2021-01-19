import 'package:flutter/material.dart';
import 'package:xscholl/src/presentation/theme/color/color_pelettes.dart';
import 'package:sizer/sizer.dart';

///Define Text Theme for the app
TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1
        ?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 25.0.sp,
          color: kXschollWhite,
        )
        ?.apply(fontFamily: 'Nexa'),
    headline2: base.headline2
        ?.copyWith(fontWeight: FontWeight.w400)
        ?.apply(fontFamily: 'Nexa'),
    subtitle1: base.subtitle1
        ?.copyWith(
            fontWeight: FontWeight.w400, fontSize: 17.0.sp, color: kXschollGrey)
        ?.apply(fontFamily: 'Nexa'),
    bodyText1: base.bodyText1
        ?.copyWith(
          fontWeight: FontWeight.w500,
          color: kXschollBlack,
        )
        ?.apply(fontFamily: 'Novello'),
    bodyText2: base.bodyText2
        ?.copyWith(
          fontWeight: FontWeight.w400,
          color: kXschollGrey,
        )
        ?.apply(fontFamily: 'Novello'),
  );
}
