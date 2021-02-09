import 'dart:typed_data';
import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/ui/draw_canvas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_ViewModel extends ChangeNotifier{
  List<Marker> allMarkers = [];


  Future<void> add_all(List<Country_cases> country_cases) async{
    country_cases.forEach((element) async {
      if(element.Lat != null && element.Long_ != null){
        Uint8List markerIcon = await Draw_Canvas.getBytesFromCanvas(350, 120, element);
        Marker m = Marker(
          markerId: MarkerId(element.Country_Region),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          draggable: false,
          position: LatLng(element.Lat.toDouble()+0.5, element.Long_.toDouble()+0.5),
        );
        allMarkers.add(m);
      }
    });
    notifyListeners();
  }


}