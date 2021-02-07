import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/ui/numberFormatter.dart';
import 'package:covid_tracker/ui/pages/map.dart';
import 'package:flutter/material.dart';

class Corona_cases extends StatelessWidget {
  static final ROUTE = '/corona_cases';

  @override
  Widget build(BuildContext context) {
    Country_cases country_cases = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: Color(0xFFf2f6f9),
        body: Column(
          children: [
            Container(
              alignment: Alignment(-1, 0),
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              color: Color(0xFFfd5a51),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                splashColor: Colors.black,
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              alignment: Alignment(-0.5, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.25,
              color: Color(0xFFfd5a51),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 168),
                    child: Text("${country_cases.Country_Region}, 2021",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontFamily: 'PoppinsSMBold')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14, top: 5.0),
                    child: Text("Corona Virus Cases",
                        style: new TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontFamily: 'PoppinsExBold')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: new Text(
                        NumberFormatter.commaFormatter(country_cases.Confirmed),
                        style: new TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                          fontFamily: 'PoppinsSMBold',
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: MediaQuery.of(context).size.height / 4.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Deaths",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'PoppinsExBold'),
                        ),
                        Text(
                          NumberFormatter.commaFormatter(country_cases.Deaths),
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontFamily: 'PoppinsSMBold',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: MediaQuery.of(context).size.height / 4.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Recovered",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'PoppinsExBold'),
                        ),
                        Text(
                          NumberFormatter.commaFormatter(
                              country_cases.Recovered),
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontFamily: 'PoppinsSMBold',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Active Case",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontFamily: 'PoppinsExBold'),
                        ),
                        Text(
                          NumberFormatter.commaFormatter(country_cases.Active),
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontFamily: 'PoppinsSMBold'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        backgroundColor: Colors.redAccent,
        splashColor: Colors.green,
        onPressed: () {
          Navigator.of(context).pushNamed(Map_.ROUTE, arguments: country_cases);
        },
      ),
    );
  }
}
