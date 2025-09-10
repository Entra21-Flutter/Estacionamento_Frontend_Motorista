import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/search_service.dart';

class SearchMapController {
  final SearchService service;
  void Function(Marker)? onMarkerTap;

  SearchMapController(this.service);

  Future<Marker?> criarMarcadorDestino(String placeId) async {
    final result = await service.getPlaceDetails(placeId);
    if (result == null) return null;

    final location = result["geometry"]["location"];
    final posicao = LatLng(location["lat"], location["lng"]);

    return Marker(
      markerId: const MarkerId("destino"),
      position: posicao,
      infoWindow: const InfoWindow(title: "Destino"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
  }

  Future<List<Marker>> criarMarcadoresEstacionamentos(LatLng posicao) async {
    final results = await service.getNearbyParking(posicao);
    final marcadores = <Marker>[];

    for (var lugar in results) {
      final lat = lugar["geometry"]["location"]["lat"];
      final lng = lugar["geometry"]["location"]["lng"];

      late Marker marcador;
      marcador = Marker(
        markerId: MarkerId(lugar["name"]),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        onTap: () {
          if (onMarkerTap != null) {
            onMarkerTap!(marcador);
          }
        },
      );

      marcadores.add(marcador);
    }

    return marcadores;
  }
}
