import 'dart:async';

import 'package:covid_tracker_app/View/world_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onInit() {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => WorldStateScreen());
    });
  }
}
