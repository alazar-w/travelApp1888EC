import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget SplashScreenWidget() {

  return SpinKitCubeGrid(
    color: Colors.black,
    size: 40,
    duration: Duration(milliseconds: 50),

  );

}

Widget LoadingWidget(){
  return SpinKitWave(
    color: Colors.black,
    size: 40,
  );
}