import 'package:covid_tracker_app/View/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "flutterDemo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home:  SplashScreen(),
    );
  }
}
