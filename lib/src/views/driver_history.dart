import 'package:flutter/material.dart';

class DriverHistory extends StatelessWidget {
  const DriverHistory({super.key});

    @override
  Widget build(BuildContext context) {
    final List<Map<String,String>> historicoEstacionamento = [
      {"nome": "Estacionamento1", "preco": "R\$20"}, // quando o cliente clicar em cima de um estacionamento deve abrir uma tela com as informações daquele momento em que o estacionamento foi usado
      {"nome": "Estacionamento2", "preco" : "R\$40"},
      {"nome": "Estacionamento3", "preco": "R\$10"},
      {"nome": "Estacionamento4", "preco": "R\$20"},
      {"nome": "Estacionamento5", "preco": "R\$40"},
      {"nome": "Estacionamento6", "preco": "R\$10"},
      {"nome": "Estacionamento7", "preco": "R\$10"},
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
              // Lista de histórico
              ...historicoEstacionamento.map((item) => Container(
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
                        Text(
                          item["preco"]!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}