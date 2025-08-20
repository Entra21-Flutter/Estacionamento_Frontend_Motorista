import 'package:flutter/material.dart';

class BarraNavegacao extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BarraNavegacao({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title)//esse title vem do menu_app.dart
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

