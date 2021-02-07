import 'dart:convert';

import 'package:covid_tracker/business_logic/models/attributes.dart';
import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/services/web_api/api.dart';
import 'package:http/http.dart' as http;

class Api_Imp extends Api {
  static final _URL = 'https://api.kawalcorona.com';

  @override
  Future<List<Country_cases>> getListData() async {
    try{
      final http.Response response = await http.get(_URL);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        return parsed
            .map<Country_cases>((item) => Attributes.fromJson(item).attr)
            .toList();
      } else {
        print('status code = ${response.statusCode}');
      }
    }catch(e){
      print('Exception from Api : ' + e.toString());
    }
  }
}
