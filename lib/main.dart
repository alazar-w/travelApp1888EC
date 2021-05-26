import 'package:flutter/material.dart';
import 'package:travelapp/screens/DetailPage/DetailScreen.dart';
import 'screens/Screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
      },
    );
  }
}
