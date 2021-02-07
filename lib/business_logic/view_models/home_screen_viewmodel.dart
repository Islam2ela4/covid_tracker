import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/services/web_api/api_imp.dart';
import 'package:flutter/material.dart';

class Home_Screen_ViewModel extends ChangeNotifier{
  List<Country_cases> _attrs;

  Future<void> loadData() async{
    try{
      _attrs = await Api_Imp().getListData();
      notifyListeners();
    }catch(e){
      print('Exception from ViewModel : ' + e.toString());
    }
  }

  List<Country_cases> get attrs => _attrs;
}