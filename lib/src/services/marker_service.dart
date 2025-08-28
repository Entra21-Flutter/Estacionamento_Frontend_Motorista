import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerService {
  final List<Map<String, dynamic>> _estacionamentos = [
    //posição real desses estacionamentos que estão perto da proway
    {"nome": "Royal park estacionamento ", "lat": -26.91827120339458, "lng": -49.06977352086222}, // -26.91827120339458, -49.06977352086222
    {"nome": "Auto serve estacionamento", "lat": -26.915121139121357, "lng": -49.0689695126889}, // -26.915121139121357, -49.0689695126889
    {"nome": "Estacionamento WF", "lat": -26.91646435413369, "lng": -49.070906304004545}, // -26.91646435413369, -49.070906304004545
  ];

 double calcularDistancia(LatLng a, LatLng b) {
    const R = 6371; // raio da Terra em km
    final dLat = (b.latitude - a.latitude) * pi / 180;
    final dLng = (b.longitude - a.longitude) * pi / 180;

    final lat1 = a.latitude * pi / 180;
    final lat2 = b.latitude * pi / 180;

    final h = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLng / 2) * sin(dLng / 2) * cos(lat1) * cos(lat2);

    return 2 * R * atan2(sqrt(h), sqrt(1 - h));
  }

  final LatLng _proway = const LatLng(-26.91688151149824, -49.07039859921882); // Exemplo: proway

  Set<Marker> criarMarkers() {
    final markers = <Marker>{};
    
    // LatLng? _pontoSelecionado;
    
    // marcador do ponto selecionado
    if (_proway != null) {
      markers.add(Marker(
        markerId: const MarkerId("pontoSelecionado"), //mostrar o nome do local selecionado corretamente 
        position: _proway!,
        infoWindow: const InfoWindow(title: "Local Selecionado"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));

      // adiciona estacionamentos próximos
      for (var est in _estacionamentos) {
        final estPos = LatLng(est["lat"], est["lng"]);
        final dist = calcularDistancia(_proway!, estPos);

        if (dist <= 1.0) { // filtra estacionamentos até 1 km
          markers.add(Marker(
            markerId: MarkerId(est["nome"]),
            position: estPos,
            infoWindow: InfoWindow(
              title: est["nome"],
              snippet: "Distância: ${dist.toStringAsFixed(2)} km",
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ));
        }
      }
    }

    return markers;
  }
}