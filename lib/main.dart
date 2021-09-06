import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            // backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(
            color: Colors.blueAccent,
          ))),
      home: OnBoarding(),
    );
  }
}
