import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:vagaja/src/controllers/maps_controller.dart';
import 'package:vagaja/src/services/marker_service.dart';
import 'package:vagaja/src/views/driver_history.dart';
import 'package:vagaja/src/views/driver_reservation.dart';
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
  final LatLng proway = const LatLng(-26.91688151149824, -49.07039859921882);
  final String apikey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? "";

  final MarkerService markerService = MarkerService();
  final MapsController mapsController = MapsController();

  final String estiloMapa = '''
  [{
      "featureType": "poi",
      "stylers": [
        { "visibility": "off" }
      ]
  }]
  ''';

  @override
  void initState() {
    super.initState();
    mapsController.onMarkerTap = (marker) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => infoPark(estacionamento: marker),
        ),
      );
    };
  }

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      DriverMapBody(
        estiloMapa: estiloMapa,
        proway: proway,
        zoomInicial: zoomInicial,
        markerService: markerService,
        mapsController: mapsController,
        onMapCreated: (controller) => mapController = controller,
      ),
      driverReservation(),
      driverHistory(),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
        ],
      ),
    );
  }
}

class DriverMapBody extends StatelessWidget {
  final String estiloMapa;
  final LatLng proway;
  final double zoomInicial;
  final MarkerService markerService;
  final MapsController mapsController;
  final void Function(GoogleMapController) onMapCreated;

  const DriverMapBody({
    super.key,
    required this.estiloMapa,
    required this.proway,
    required this.zoomInicial,
    required this.markerService,
    required this.mapsController,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: true,
          style: estiloMapa,
          buildingsEnabled: false,
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: proway,
            zoom: zoomInicial,
          ),
          markers: markerService.criarMarkers(onTap: mapsController.marcadorClicado),
        ),
      ],
    );
  }
}