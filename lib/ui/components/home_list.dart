import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:covid_tracker/ui/components/list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.select((Home_Screen_ViewModel m) => m.attrs);
    if(model.isEmpty){
      return Align(
        child: CircularProgressIndicator(),
      );
    }else{
      return List_view(model);
    }

  }

}