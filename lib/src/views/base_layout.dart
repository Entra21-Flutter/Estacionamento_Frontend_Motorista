import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vagaja/src/layouts/custom_drawer.dart';
import 'package:vagaja/src/layouts/custom_navbar.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseLayout({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraNavegacao(title: title,),
      drawer: CustomDrawer(),
      body: body,
    );
  }
}