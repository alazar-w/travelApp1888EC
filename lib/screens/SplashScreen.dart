import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/widgets/SplashScreenWidget.dart';
class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    return Container(
      height: media.size.height,
      width: media.size.width,
      color: Colors.white,
      child: Center(
        child: SplashScreenWidget(),
      ),
    );
  }
}
