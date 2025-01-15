void main() {

  // Assincronismo

  // Future
  // É um objeto que retorna um valor ou erro, resultado de uma execução assíncrona/futura

  print(tarefa(tempo: 4)); // É executado antes do término da Future. Status: Primeira tarefa finalizada
  
  novaTarefa(tempo: 2); // Status: Segunda tarefa finalizada

  contagem(segudos: 3); // Carregando... 34% 35% 36% Pronto!

}

String tarefa({int tempo = 1}) {
  var msg = status(tempo: tempo);
  return "Status: $msg";
}

Future<String> status({int tempo = 1}) {
  return Future.delayed(Duration(seconds: tempo), () => "Primeira tarefa finalizada");
}

void novaTarefa({int tempo = 1}) {
  Future.delayed(Duration(seconds: tempo), () => print("Status: Segunda tarefa finalizada"));
}

void contagem({int segudos = 3}) {

  print("Carregando...");

  for (var i = 1; i <= segudos; i++) {

    Future.delayed(Duration(seconds: 1), () {
      print("${i + 33}%");

      if (i == segudos) {
        print("Pronto!");
      }
    });
  }
}