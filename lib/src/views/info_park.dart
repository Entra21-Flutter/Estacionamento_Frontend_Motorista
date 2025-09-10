import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class infoPark extends StatelessWidget {
  final Marker? estacionamento;
  final double precoPorMinuto;

  const infoPark({
    super.key,
    required this.estacionamento,
    this.precoPorMinuto = 0.50, // valor exemplo
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Informações do Estacionamento"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              estacionamento!.markerId.value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _VagaInfo(
                  label: "Cobertas",
                  quantidade: 5,
                  icon: Icons.garage,
                ),
                _VagaInfo(
                  label: "Descobertas",
                  quantidade: 8,
                  icon: Icons.local_parking,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Preço por minuto: R\$ ${precoPorMinuto.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.garage),
              label: const Text("Reservar vaga coberta"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Lógica para reservar vaga coberta
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.local_parking),
              label: const Text("Reservar vaga descoberta"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                // Lógica para reservar vaga descoberta
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _VagaInfo extends StatelessWidget {
  final String label;
  final int quantidade;
  final IconData icon;

  const _VagaInfo({
    required this.label,
    required this.quantidade,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 36, color: Colors.blueAccent),
        const SizedBox(height: 4),
        Text(
          "$quantidade",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
