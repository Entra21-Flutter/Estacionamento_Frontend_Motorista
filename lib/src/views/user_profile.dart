import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto de perfil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile_placeholder.png"), // pode trocar por NetworkImage
              ),
            ),
            const SizedBox(height: 16),

            // Nome
            const Text(
              "Marcos V. P. Júnior",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // Email
            const Text(
              "Marcos@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Botão editar
            ElevatedButton.icon(
              onPressed: () {
                // futuramente -> abrir tela de edição
              },
              icon: const Icon(Icons.edit),
              label: const Text("Editar perfil"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 12),

          ],
        ),
      ),
    );
  }
}