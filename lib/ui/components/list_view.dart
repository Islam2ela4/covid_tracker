import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/ui/numberFormatter.dart';
import 'package:covid_tracker/ui/pages/corona_cases.dart';
import 'package:flutter/material.dart';

class List_view extends StatelessWidget {
  List<Country_cases> list;

  List_view(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: ListTile(
              title: _customRowList(context, list[index]),
              onTap: () {
                // hide keyboard to avoid insets
                FocusScope.of(context).requestFocus(new FocusNode());
                Navigator.of(context)
                    .pushNamed(Corona_cases.ROUTE, arguments: list[index]);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _customRowList(BuildContext context, Country_cases cases) {
    return Row(
      children: <Widget>[
        Expanded(
          child: cases.Country_Region.length < 8
              ? Text(
            cases.Country_Region,
            style: Theme.of(context).textTheme.headline2,
          )
              : Text(
            cases.Country_Region.substring(0, 7),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: Icon(
            Icons.flag_rounded,
            color: Colors.red,
            size: 20,
          ),
        ),
        Expanded(
          child: Text(
            NumberFormatter.formatter(cases.Confirmed),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: Text(
            NumberFormatter.formatter(cases.Recovered),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: Text(
            '\t\t' + NumberFormatter.formatter(cases.Deaths),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}
