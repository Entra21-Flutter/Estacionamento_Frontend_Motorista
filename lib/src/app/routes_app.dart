import 'package:flutter/widgets.dart';
import 'package:vagaja/src/app/menu_app.dart';
import 'package:vagaja/src/views/base_layout.dart';

Map<String, WidgetBuilder> generateRoutes(){
  final Map<String, WidgetBuilder> routes = {};

  for (var item in appMenuitens) {
    routes[item.route] = 
      (context) => BaseLayout(
        title: item.title, body: item.page);
  }

  return routes;
}