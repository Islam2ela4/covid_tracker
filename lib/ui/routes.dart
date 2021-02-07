
import 'package:covid_tracker/ui/pages/corona_cases.dart';
import 'package:covid_tracker/ui/pages/home.dart';
import 'package:covid_tracker/ui/pages/map.dart';
import 'package:covid_tracker/ui/pages/splash.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  Splash.ROUTE: (context) => Splash(),
  Home.ROUTE: (context) => Home(),
  Corona_cases.ROUTE: (context) => Corona_cases(),
  Map_.ROUTE: (context) => Map_()
};