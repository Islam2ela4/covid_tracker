import 'package:covid_tracker/business_logic/models/country_cases.dart';

abstract class Api{
  Future<List<Country_cases>> getListData();
}