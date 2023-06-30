import 'dart:convert';

import 'package:flutter_covid_tracker/Models/world_states_model.dart';
import 'package:flutter_covid_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStates() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error Occrred in StatesServices class.');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Erroe occurred in StateServices class.');
    }
  }
}
