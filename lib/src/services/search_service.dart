import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SearchService {
  final String apiKey;
  SearchService(this.apiKey);

  Future<Map<String, dynamic>?> getPlaceDetails(String placeId) async {
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/details/json"
      "?place_id=$placeId&key=$apiKey",
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["result"];
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getNearbyParking(LatLng posicao) async {
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
      "?location=${posicao.latitude},${posicao.longitude}"
      "&radius=1000&type=parking&key=$apiKey",
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data["results"]);
    }
    return [];
  }
}
