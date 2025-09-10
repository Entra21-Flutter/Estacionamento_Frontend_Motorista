import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PositionController extends ChangeNotifier{
  double lat = 0.0;
  double lng = 0.0;
  String erro = '';

  PositionController() {
    getPosicaoAtual();
  }

  getPosicaoAtual() async {
    try{
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      lng = posicao.longitude;
    }catch(e){
      erro = e.toString();
    }
    notifyListeners();
  }



  Future<Position> _posicaoAtual() async{
    LocationPermission permissao;
    
    bool servicoAtivo = await Geolocator.isLocationServiceEnabled();
    if (!servicoAtivo) {
      return Future.error("Ative sua localização");
    } 

    permissao = await Geolocator.checkPermission();
    if(permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error("Voce precisa autorizar o acesso a localização");
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error("Voce precisa autorizar o acesso a localização Manualmente");
    }

    return await Geolocator.getCurrentPosition();
  }
}

