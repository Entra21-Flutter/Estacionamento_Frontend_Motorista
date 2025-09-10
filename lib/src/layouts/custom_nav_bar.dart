import 'package:flutter/material.dart';

import 'package:vagaja/src/services/auth_service.dart';
import 'package:vagaja/src/views/driver_login.dart';

class BarraNavegacao extends StatelessWidget implements PreferredSizeWidget {
  const BarraNavegacao({super.key, });

  @override
  Widget build(BuildContext context) {
      return AppBar(
        title: Text("VagaJá"),
        centerTitle: true,
        leading : 
           IconButton(
            icon: const Icon(Icons.logout, size: 30,),
            onPressed: () {
              AuthService.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const DriverLogin()),
                (route) => false,
              );
            },
          ),
          
          // Botão de perfil
          actions: [ IconButton(
            icon: const Icon(Icons.person_pin, size: 40,),
            onPressed: () {
              Navigator.pushNamed(context, "/perfil"); 
            },
          ),

          // Botão de sair
          ]
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

