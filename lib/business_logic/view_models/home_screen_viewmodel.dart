import 'dart:typed_data';

import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/services/web_api/api_imp.dart';
import 'package:covid_tracker/ui/draw_canvas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home_Screen_ViewModel extends ChangeNotifier{
  List<Country_cases> _attrs = [];
  List<Marker> _allMarkers = [];

  Future<void> loadData() async{
    try{
      _attrs = await Api_Imp().getListData();
      notifyListeners();
      _attrs.forEach((element) async {
        if(element.Lat != null && element.Long_ != null){
          Uint8List markerIcon = await Draw_Canvas.getBytesFromCanvas(350, 120, element);
          Marker m = Marker(
            markerId: MarkerId(element.Country_Region),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            draggable: false,
            position: LatLng(element.Lat.toDouble()+0.5, element.Long_.toDouble()+0.5),
          );
          _allMarkers.add(m);
        }
      });
      notifyListeners();
    }catch(e){
      print('Exception from ViewModel : ' + e.toString());
    }
  }

  List<Country_cases> get attrs => _attrs;
  List<Marker> get allMarkers => _allMarkers;
}