import 'package:flutter/material.dart';
import 'package:vagaja/src/models/menu_model.dart';
import 'package:vagaja/src/views/driver_history.dart';
import 'package:vagaja/src/views/driver_map.dart';
import 'package:vagaja/src/views/driver_reservation.dart';


final List<MenuModel> appMenuitens = [
    MenuModel(
    title: "Reservas", 
    icon: Icons.bookmark,
    route: "/reservas",
    page: DriverReservation()
    ),

    MenuModel(
    title: "Mapa", 
    icon: Icons.map_sharp,
    route: "/maps",
    page: DriverMap()
    ),

    MenuModel(
    title: "Historico", 
    icon: Icons.history_edu,
    route: "/history",
    page: DriverHistory()
    ),
    



];