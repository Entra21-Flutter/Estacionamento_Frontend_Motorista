import 'package:flutter/material.dart';

class DriverReservation extends StatelessWidget {
  const DriverReservation({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de lista de reservas (vazia para exibir a mensagem)
    final List<Map<String, dynamic>> reservas = [];

    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Reservas')),
      body: reservas.isEmpty
          ? const Center(
              child: Text(
                'Aqui serão listadas suas reservas',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: reservas.length,
              itemBuilder: (context, index) {
                final reserva = reservas[index];
                return ListTile(
                  title: Text(reserva['estacionamento']),
                  subtitle: Text(reserva['data']),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverReservationDetail(
                          data: reserva['data'],
                          valor: reserva['valor'],
                          estacionamento: reserva['estacionamento'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class DriverReservationDetail extends StatelessWidget {
  final String data;
  final double valor;
  final String estacionamento;

  const DriverReservationDetail({
    super.key,
    required this.data,
    required this.valor,
    required this.estacionamento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Reserva')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estacionamento: $estacionamento',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Data/Hora: $data', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('Valor: R\$ ${valor.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}