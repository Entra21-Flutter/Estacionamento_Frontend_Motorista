import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';

class SearchService {
  final String apiKey;

  SearchService(this.apiKey);

  /// Callback quando o usuário seleciona um local da busca
  void onPlaceSelected(Prediction prediction) {

    debugPrint("Local selecionado: ${prediction.description}");
    debugPrint("Coordenadas: ${prediction.lat}, ${prediction.lng}");
  }
}
