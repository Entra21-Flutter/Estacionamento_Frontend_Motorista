import 'package:flutter/material.dart';
import 'package:vagaja/src/layouts/custom_bar.dart';
import 'package:vagaja/src/layouts/custom_nav_bar.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final int selectedIndex;

  const BaseLayout({
    super.key,
    required this.title,
    required this.body,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraNavegacao(),
      body: body,
      bottomNavigationBar: CustomBottomBarLayout(
        selectedIndex: selectedIndex, // ✅ recebe aqui
      ),
    );
  }
}

