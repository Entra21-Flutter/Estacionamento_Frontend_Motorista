import 'package:flutter/material.dart';
import 'package:vagaja/src/models/menu_model.dart';
import 'package:vagaja/src/views/home_view.dart';

final List<MenuModel> appMenuitens = [
  MenuModel(
    title: "home", 
    icon: Icons.home,
    route: "/home",
    page: HomeView()
    ),


];