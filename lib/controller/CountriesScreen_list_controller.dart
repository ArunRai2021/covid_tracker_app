import 'dart:convert';
import 'package:covid_tracker_app/model/services/Utilities/app_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CountriesScreenListController extends GetxController {
  Future<List<dynamic>> fetchCountriesRecords() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
