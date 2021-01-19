import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer_util.dart';

import '../presentation/theme/color/color_pelettes_theme.dart';

class Application extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xff345FB4),
    ));
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
              theme: kXschollTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              navigatorKey: Modular.navigatorKey,
              onGenerateRoute: Modular.generateRoute,
            );
          },
        );
      },
    );
  }
}
