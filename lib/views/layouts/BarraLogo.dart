import 'package:flutter/material.dart';

class Barralogo extends StatelessWidget implements PreferredSizeWidget {
  const Barralogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[200],
      title: ClipOval(
        child: Image.asset(
          'assets/images/LogoVagaJa.jpg',
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
