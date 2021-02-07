import 'dart:typed_data';

import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/ui/draw_canvas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_ViewModel extends ChangeNotifier{
  List<Marker> allMarkers = [];


  void add_all(List<Country_cases> country_cases){
    country_cases.forEach((element) async {
      Uint8List markerIcon = await Draw_Canvas.getBytesFromCanvas(350, 120, element);
      Marker m = Marker(
        markerId: MarkerId(element.Country_Region),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        draggable: false,
        position: LatLng(element.Lat+0.5, element.Long_+0.5),
      );
      allMarkers.add(m);
    });
    notifyListeners();
  }


}