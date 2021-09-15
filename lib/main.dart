import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/components/blocobserver/bloc_observer.dart';
import 'package:shopping/layout/shop_layout/shop_layout.dart';
import 'package:shopping/models/login_model/login_model.dart';
import 'package:shopping/modules/login/login_screen.dart';
import 'package:shopping/modules/onboarding/onboarding.dart';

import 'package:shopping/network/local/cach_helper.dart';
import 'package:shopping/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.dioInit();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onboarding");
  String? token = CacheHelper.getData(key: "token");
  print(onBoarding);

  Widget widget;

  if (onBoarding == true) {
    if (token is String)
      widget = ShopLayout();
    else
      widget = LoginScreen();
  } else
    widget = OnBoardingScreen();

  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            // titleTextStyle: TextStyle(color: Colors.red),

            actionsIconTheme: IconThemeData(color: Colors.black),
            // backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.blueAccent,
            ),
            headline4: TextStyle(
              color: Colors.black,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
          ),
        ),
        home: startWidget);
  }
}
