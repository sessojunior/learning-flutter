import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final void Function() reiniciar;
  const Resultado(this.pontuacaoTotal, this.reiniciar, {super.key});

  String get fraseResultado {
    switch (pontuacaoTotal) {
      case < 10:
        return 'Precisa melhorar!';
      case < 15:
        return 'Muito bom!';
      case < 25:
        return 'Excelente!';
      default:
        return 'Impressionante!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Parabéns!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(fraseResultado.toString(), style: TextStyle(fontSize: 16)),
          Text('Você fez $pontuacaoTotal pontos', style: TextStyle(fontSize: 14)),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () => reiniciar(), child: Text('Reiniciar')),
        ],
      ),
    );
  }
}
