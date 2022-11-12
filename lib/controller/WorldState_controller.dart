import 'dart:convert';

import 'package:covid_tracker_app/model/WorldStatesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/services/Utilities/app_url.dart';

class WorldStateController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  Future<WorldStatesModel> fetchWorldStateRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesAPi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}
