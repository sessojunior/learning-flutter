import 'package:flutter/material.dart';
import 'package:quizz/questionario.dart';
import 'package:quizz/resposta.dart';
import 'package:quizz/resultado.dart';

void main() {
  runApp(MeuApp());
}

class MeuAppState extends State<MeuApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': [
        {'valor': 'Preto', 'pontos': 10},
        {'valor': 'Branco', 'pontos': 5},
        {'valor': 'Vermelho', 'pontos': 3},
        {'valor': 'Verde', 'pontos': 1},
      ]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'valor': 'Cachorro', 'pontos': 10},
        {'valor': 'Gato', 'pontos': 5},
        {'valor': 'Elefante', 'pontos': 3},
        {'valor': 'Tigre', 'pontos': 1},
      ]
    },
    {
      'pergunta': 'Qual é o seu idioma favorito?',
      'respostas': [
        {'valor': 'Português', 'pontos': 10},
        {'valor': 'Inglês', 'pontos': 5},
        {'valor': 'Español', 'pontos': 3},
        {'valor': 'Italiano', 'pontos': 1},
      ]
    }
  ];

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontos;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> respostas = [];
    List<Map<String, Object>>? listaRespostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'] as List<Map<String, Object>>? : [];

    // if (listaRespostas is List) {
    //   for (var resposta in listaRespostas) {
    //     respostas.add(Resposta(resposta, _responder));
    //   }
    // }
    respostas = listaRespostas!.map((resposta) => Resposta(resposta['valor'] as String, () => _responder(resposta['pontos'] as int))).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Center(child: Text('Quizz', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
        ),
        body: temPerguntaSelecionada
            ? Center(
                child: Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, respostas: respostas),
              )
            : Resultado(_pontuacaoTotal, reiniciar),
      ),
    );
  }
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  MeuAppState createState() {
    return MeuAppState();
  }
}
