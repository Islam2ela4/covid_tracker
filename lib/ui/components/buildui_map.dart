import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class BuildUI_Map extends StatelessWidget {
  LatLng latLng;
  double zoom;

  BuildUI_Map({this.latLng, this.zoom});

  @override
  Widget build(BuildContext context) {
    var model = context.select((Home_Screen_ViewModel m) => m.allMarkers);
    if (model.isEmpty) {
      return Align(child: CircularProgressIndicator(),);
    }else{
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: zoom,
        ),
        mapType: MapType.normal,
        markers: Set.from(model),
        minMaxZoomPreference: MinMaxZoomPreference(5.0, 10.0),
      );
    }
  }
}
