import 'package:flutter/material.dart';
import 'package:front_archetype/src/ui/home/home_ui.dart';
import 'package:front_archetype/src/ui/splash/splash_ui.dart';
import 'package:front_archetype/src/utils/constants.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: Constants.robotoFont
      ),
      initialRoute: Constants.root,
      routes: {
        Constants.root: (context) => SplashPage(),
        Constants.homeRoute: (context) => HomePage(),
      },
    );
  }
}