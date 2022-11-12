import 'package:covid_tracker_app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: splashController.controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: const Center(
                      child: Image(image: AssetImage("images/virus.png")),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: splashController.controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              const Text(
                "Covid 19\nTracker App....",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
