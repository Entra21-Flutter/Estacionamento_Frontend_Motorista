import 'package:flutter/material.dart';

class BarraNavegacao extends StatelessWidget implements PreferredSizeWidget {
  const BarraNavegacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Barra de Navegação'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}