import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:covid_tracker/business_logic/view_models/map_viewmodel.dart';
import 'package:covid_tracker/ui/pages/splash.dart';
import 'package:covid_tracker/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Home_Screen_ViewModel>(
        create: (_) => Home_Screen_ViewModel(),
      ),
      ChangeNotifierProvider<Map_ViewModel>(
        create: (_) => Map_ViewModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          accentColor: Colors.green,
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontFamily: 'PoppinsSMBold', fontSize: 13),
            headline2: TextStyle(
                color: Colors.black, fontFamily: 'PoppinsSMBold', fontSize: 14),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.ROUTE,
      routes: routes,
    );
  }
}
