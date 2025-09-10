import 'package:flutter/widgets.dart';
import 'package:vagaja/src/app/menu_app.dart';
import 'package:vagaja/src/views/base_layout.dart';

Map<String, WidgetBuilder> generateRoutes() {
  final Map<String, WidgetBuilder> routes = {};

  for (int i = 0; i < appMenuitens.length; i++) {
    final item = appMenuitens[i];

    routes[item.route] = (context) => BaseLayout(
          title: item.title,
          body: item.page,
          selectedIndex: i,
        );
  }

  return routes;
}
