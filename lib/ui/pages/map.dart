
import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:covid_tracker/ui/components/buildui_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Map_ extends StatelessWidget {
  static final ROUTE = '/map';
  Country_cases country_cases;
  LatLng lat_long;

  @override
  Widget build(BuildContext context) {
    country_cases = ModalRoute.of(context).settings.arguments;
    lat_long = LatLng(country_cases.Lat.toDouble(), country_cases.Long_.toDouble());

    return Scaffold(
      body: BuildUI_Map(latLng: lat_long, zoom: 6.0,),
    );
  }

}

