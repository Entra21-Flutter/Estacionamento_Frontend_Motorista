import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../controllers/maps_controller.dart';
import '../controllers/search_controller.dart';
import '../services/search_service.dart';
import 'info_park.dart';

class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final LatLng _posicaoInicial = const LatLng(-26.9187, -49.0661);

  late MapsController mapMarkerController;
  late SearchMapController searchController;

@override
void initState() {
  super.initState();
  final apiKey = dotenv.get('SEARCH_API_KEY');
  searchController = SearchMapController(SearchService(apiKey));

  searchController.onMarkerTap = (marker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => InfoPark(estacionamento: marker),
      ),
    );
  };
}

Future<void> _buscarLocal(String placeId) async {
  final destino = await searchController.criarMarcadorDestino(placeId);
  if (destino == null) return;

  setState(() {
    _markers.clear();
    _markers.add(destino);
  });

  _mapController?.animateCamera(
    CameraUpdate.newLatLngZoom(destino.position, 16),
  );

  final estacionamentos =
      await searchController.criarMarcadoresEstacionamentos(destino.position);

  setState(() {
    _markers.addAll(estacionamentos);
  });
}

final String estiloMapa = '''
  [{
      "featureType": "poi",
      "stylers": [
        { "visibility": "off" }
      ]
  }]
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            style: estiloMapa,
            buildingsEnabled: false,
            rotateGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _posicaoInicial,
              zoom: 14,
            ),
            markers: _markers,
            onMapCreated: (c) => _mapController = c,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Card(
              child: GooglePlaceAutoCompleteTextField(
                textEditingController: _searchController,
                focusNode: _focusNode,
                googleAPIKey: dotenv.get('SEARCH_API_KEY'),
                inputDecoration: const InputDecoration(
                  hintText: "Pesquise um local",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
                countries: ["br"],
                itemClick: (Prediction p) {
                  _searchController.text = p.description ?? "";
                  _focusNode.unfocus();
                  _buscarLocal(p.placeId!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
