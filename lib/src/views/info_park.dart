import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoPark extends StatefulWidget {
  final Marker? estacionamento;
  final double precoPorMinuto;
  static const double precoPorHora = 10.00;

  const InfoPark({
    super.key,
    required this.estacionamento,
    double? precoPorMinuto,
  }) : precoPorMinuto = precoPorMinuto ?? precoPorHora / 60;

  @override
  State<InfoPark> createState() => _InfoParkState();
}

class _InfoParkState extends State<InfoPark> {
  int vagasCobertas = 5; // valor fictício
  int vagasDescobertas = 8; // valor fictício

  void reservarVagaCoberta() {
    setState(() {
      if (vagasCobertas > 0) {
        vagasCobertas--;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Vaga coberta reservada com sucesso!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sem vagas cobertas disponíveis.")),
        );
      }
    });
  }

  void reservarVagaDescoberta() {
    setState(() {
      if (vagasDescobertas > 0) {
        vagasDescobertas--;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Vaga descoberta reservada com sucesso!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sem vagas descobertas disponíveis.")),
        );
      }
    });
  }

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
              widget.estacionamento?.markerId.value ?? "Estacionamento",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _VagaInfo(
                  label: "Cobertas",
                  quantidade: vagasCobertas,
                  icon: Icons.garage,
                ),
                _VagaInfo(
                  label: "Descobertas",
                  quantidade: vagasDescobertas,
                  icon: Icons.local_parking,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Preço hora: R\$ ${InfoPark.precoPorHora.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Preço por minuto: R\$ ${widget.precoPorMinuto.toStringAsFixed(2)}',
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
              onPressed: reservarVagaCoberta,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.local_parking),
              label: const Text("Reservar vaga descoberta"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: reservarVagaDescoberta,
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
