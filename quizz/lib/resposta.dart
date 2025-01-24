import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() selecionado;

  const Resposta(this.texto, this.selecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: selecionado,
        child: Text(texto),
      ),
    );
  }
}
