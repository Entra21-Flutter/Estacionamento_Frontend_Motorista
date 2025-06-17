import 'package:flutter/material.dart';

class Barralogo extends StatelessWidget implements PreferredSizeWidget {
  const Barralogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[800],
      centerTitle: true,
      title: Image.asset(
        'assets/images/LogoVagaJa.jpg', // Caminho relativo ao pubspec.yaml
        height: 40, // Ajuste a altura conforme necessário
        
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}