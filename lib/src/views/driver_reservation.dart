import 'package:flutter/material.dart';

class driverReservation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exemplo de lista de reservas
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Reservas')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Estacionamento Central'),
            subtitle: Text('10/09/2025 - 14:00'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => driverReservationState(
                    data: '10/09/2025 - 14:00',
                    valor: 20.0,
                    estacionamento: 'Estacionamento Central',
                  ),
                ),
              );
            },
          ),
          // ...outras reservas...
        ],
      ),
    );
  }
}

class driverReservationState extends StatelessWidget {
  final String data;
  final double valor;
  final String estacionamento;

  const driverReservationState({
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
            Text('Estacionamento: $estacionamento', style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            Text('Data/Hora: $data', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text('Valor: R\$ ${valor.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}