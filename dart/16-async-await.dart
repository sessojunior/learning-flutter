Future<void> main() async {

  // Async await

  // Operação Síncrona:
  // Bloqueia a execução até a operação seja concluída
  // Funções síncronas: executa somente operações síncronas

  // Operação Assíncrona:
  // Permite executar outras operações enquanto são processadas
  // Funções assíncronas: executa ao menos uma operação assíncrona e operações síncronas

  // Await
  // Indica a espera de uma operação assíncrona ser concluida, conclusão de uma Future

  // Async
  // Deve ser usado em toda função que tenha operações assíncronas, Await

  contagem(segudos: 3); // Função síncrona

  print(await tarefa(tempo: 4)); // Função assíncrona
}

// Funções assíncronas

Future<String> tarefa({int tempo = 1}) async {
  var msg = await status(tempo: tempo);
  return "Status: $msg";
}

Future<String> status({int tempo = 1}) {
  return Future.delayed(Duration(seconds: tempo), () => "Primeira tarefa finalizada");
}

// Função síncrona

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