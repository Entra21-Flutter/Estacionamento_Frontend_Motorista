import 'package:flutter/material.dart';
import 'package:vagaja/src/models/menu_model.dart';
import 'package:vagaja/src/views/driver_history.dart';
import 'package:vagaja/src/views/driver_map.dart';
import 'package:vagaja/src/views/home_view.dart';

final List<MenuModel> appMenuitens = [
  MenuModel(
    title: "Home", 
    icon: Icons.home,
    route: "/home",
    page: HomeView()
    ),
    MenuModel(
    title: "Mapa", 
    icon: Icons.map_sharp,
    route: "/maps",
    page: DriverMap()
    ),
    MenuModel(
    title: "Historico de pagamento", 
    icon: Icons.history_edu,
    route: "/history",
    page: DriverHistory()
    ),
    



];