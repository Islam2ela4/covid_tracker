import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:covid_tracker/ui/components/list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search_list extends StatelessWidget {
  String search_str;

  Search_list(this.search_str);

  @override
  Widget build(BuildContext context) {
    var model = context.select((Home_Screen_ViewModel m) => m.attrs);
    return search_str == '' || filter(model).isEmpty
        ? Container()
        : List_view(filter(model));
  }

  List<Country_cases> filter(List<Country_cases> base_list) {
    List<Country_cases> dummy_list = [];
    base_list.forEach((country_cases) {
      if (search_str != null && country_cases.Country_Region.toLowerCase()
          .startsWith(search_str.toLowerCase())) {
        dummy_list.add(country_cases);
      }
    });
    return dummy_list;
  }

}