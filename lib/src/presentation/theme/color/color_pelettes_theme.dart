import 'package:flutter/material.dart';
import 'package:xscholl/src/presentation/theme/text/text_theme.dart';

import 'color_pelettes.dart';

final ThemeData kXschollTheme = _buildXschollTheme();

//The app define theme
ThemeData _buildXschollTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: kXschollBlue,
      scaffoldBackgroundColor: kXschollWhite,
      textTheme: buildTextTheme(base.textTheme));
}
