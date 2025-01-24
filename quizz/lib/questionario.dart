import 'package:flutter/material.dart';
import 'questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final List<Widget> respostas;

  const Questionario({required this.perguntas, required this.perguntaSelecionada, required this.respostas, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
        ...respostas,
      ],
    );
  }
}
