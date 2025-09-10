import 'package:flutter/material.dart';
import 'package:vagaja/src/views/driver_reservation.dart';

// Importe ou crie o widget DetalheHistoricoPage conforme necessário

class DriverHistory extends StatelessWidget {
  const DriverHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> historicoEstacionamento = [
      {
        "nome": "VagasNow",
        "preco": "R\$20",
        "data": "08/09/2025 - 10:00"
      },
      {
        "nome": "TopVagas",
        "preco": "R\$40",
        "data": "07/09/2025 - 15:30"
      },
      {
        "nome": "SemEspera",
        "preco": "R\$10",
        "data": "06/09/2025 - 09:20"
      },

    ];

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/novobannervagaja6.png"),
              const SizedBox(height: 10),
              ...historicoEstacionamento.map(
                (item) => InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DriverReservationDetail(
                          data: item["data"] ?? "",
                          valor: double.tryParse(
                                  item["preco"]!.replaceAll(RegExp(r'[^\d.]'), '')) ??
                              0.0,
                          estacionamento: item["nome"] ?? "",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["nome"]!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item["preco"]!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item["data"]!,
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}