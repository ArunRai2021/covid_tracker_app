import 'dart:convert';

import 'package:covid_tracker_app/model/services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../WorldStatesModel.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesAPi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
     }
  }
}
