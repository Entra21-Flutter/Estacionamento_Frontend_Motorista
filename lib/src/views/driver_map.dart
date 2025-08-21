import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => DriverMapState();
}

class DriverMapState extends State<DriverMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-27.5969, -48.5495); // Exemplo: Florianópolis

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0
          ),
        
      ),
    );
  }
}