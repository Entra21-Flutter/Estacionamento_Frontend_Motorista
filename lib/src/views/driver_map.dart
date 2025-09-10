import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:vagaja/src/controllers/maps_controller.dart';
import 'package:vagaja/src/services/marker_service.dart';
import 'package:vagaja/src/views/info_park.dart';


class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => DriverMapState();
}

class DriverMapState extends State<DriverMap> {
  late GoogleMapController mapController;
  static const double zoomInicial = 18.0;
  final TextEditingController searchController = TextEditingController();
  final LatLng _proway = const LatLng(-26.91688151149824, -49.07039859921882); // Exemplo: proway
  final String apikey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? "";
  
  MarkerService marker = MarkerService();
  MapsController mapsController = MapsController();

  final String _estiloMapa = '''
[{
    "featureType": "poi",
    "stylers": [
      { "visibility": "off" }
    ]
    }]
    ''';
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    mapsController.onMarkerTap = (marker) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => InformacaoEstacionamento(estacionamento: marker),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            style: _estiloMapa,
            buildingsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _proway,
              zoom: zoomInicial
            ),
            markers: marker.criarMarkers(onTap: mapsController.marcadorClicado),
          ),
        ]
      ),
    );

  }
}