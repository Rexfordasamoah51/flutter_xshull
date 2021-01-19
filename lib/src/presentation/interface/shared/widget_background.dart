import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xscholl/src/presentation/theme/color/color_pelettes.dart';

class BaseBackground extends StatelessWidget {
  final Widget child;

  const BaseBackground({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: kXschollBlueGradient),
          child: child),
    );
  }
}
