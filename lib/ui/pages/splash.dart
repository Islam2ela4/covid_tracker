import 'dart:async';

import 'package:covid_tracker/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  static final ROUTE = '/';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Home.ROUTE);
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Covid Tracker',
          style: TextStyle(
              fontSize: 45.0, color: Colors.white, fontFamily: 'PoppinsExBold'),
        ),
      ),
    );
  }
}

