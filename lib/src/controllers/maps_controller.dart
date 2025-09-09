import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController {
  void Function(Marker)? onMarkerTap;

  void marcadorClicado(Marker marker) {
    if (onMarkerTap != null) {
      onMarkerTap!(marker);
    }
  }
}