void main() {

  // Funções
  saudacao();
  print("Agora: ${agora()}");
  saudacaoComParametroPosicional("Mario", false, "Boa tarde");
  saudacaoComParametroPosicional("Lucas");
  saudacaoComParametroNomeado("Fernanda", mostrarAgora: false);
  saudacaoComParametroNomeado("Julia", separador: "-", mostrarAgora: true);
  saudacaoNullable();
  saudacaoNullable(nome: "Maria");
  saudacaoConverteNullable("Irene");
  saudacaoConverteNullable();
  funcao("Mario", b: "boom", d: null);
  funcaoB();
  funcaoA(corpo: funcaoB); // Passa a função funcaoB como parâmetro
  funcaoA(corpo: funcaoB, corpo2: funcaoC); // Passa a função funcaoB e funcaoC como parâmetro
  funcaoA(corpo: funcaoB, corpo2: (i) {
    print("Função anônima!");
    for (int i = 0; i < 10; i++) {
      print("Olá $i");
    }
  }); // Passa uma função anonima como parâmetro
  funcaoA(corpo: () => print("Função arrow!")); // Passa uma arrow function como parâmetro
}

// Funções

void saudacao() {
  print("Bom dia. Tudo bem?");
  print("Data: ${agora()}");
}

// Retorno de funções

String agora() {
  DateTime agora = DateTime.now();
  return agora.toString();
}

// Parâmetros de funções
// [bool mostrarAgora] = true // Colocando dentro de colchetes [], torna o parâmetro opcional posicional, 
// mas é obrigatório nesse caso deixar um valor padrão para caso não passe um valor
// Parâmetros posicionais devem ser declaradas na mesma posição
// Parâmetros nomeados devem ser declarados com o nome do parâmetro, dois-pontos e depois o valor
void saudacaoComParametroPosicional(String nome, [bool mostrarAgora = true, String saudacao = "Bom dia"]) {
  print("$saudacao, $nome!");
  if (mostrarAgora) {
    print("Data agora (do parâmetro posicional): ${agora()}");
  }
}

// Usando parâmetros opcionais nomeados, utilizando as chaves {}
// Para passar um parâmetro nomeado que seja obrigatório, é preciso colocar required antes da variável
void saudacaoComParametroNomeado(String nome, {bool mostrarAgora = true, String separador = "*"}) {
  print("$separador" * 20);
  print("Como vai, $nome?");
  if (mostrarAgora) {
    print("Data agora (do parâmetro nomeado): ${agora()}");
  }
}

// Variáveis nullable e non-nullable
// Para tornar uma variável null é preciso colocar um ponto de interrogação ? após o tipo da variável

// Ao colocar ponto de interrogação na frente do tipo, ele torna a variável null
void saudacaoNullable({String? nome}) {
  print("Você é: $nome!");
  if (nome != null) {
    print("Você tem nome! E seu nome é $nome");
  }
}

// Conversão de variáveis nullable para non-nullable
// Basta colocar um if verificando se a variável é null
void saudacaoConverteNullable([String? nome]) {
  if (nome != null) {
    print("Como vai, ${nome.toUpperCase()}?");
  } else {
    print("Como vai, desconhecido?");
  }

  String cliente = nome ?? "não informado";
  print("Legal, $cliente!");
}

// Exemplos de parâmetros da função
void funcao(
  String nome, // Parâmetro posicional obrigatório e não pode ser null
  {
    String? a, // Parâmetro nomeado opcional, e pode ser null
    required String b, // Parâmetro nomeado obbrigatório e não pode ser null
    String c = "default", // Parâmetro nomeado com valor padrão
    String? d = "default permitindo null", // Parâmetro nomeado com valor padrão permitindo null
  }
) {
  print("Olá $nome - Variável: $a, $b, $c, $d!");
}

// Passagem de funções por parâmetro
void funcaoA({
  required Function corpo, // Parâmetro obrigatório que recebe uma função sem parâmetro
  Function(int)? corpo2 // Parâmetro opcional que recebe uma função com parâmetro int
}) {
  print("Função A!");
  corpo();
  if (corpo2 != null) {
    corpo2(5); // Coloca o parâmetro int
  }
}

// Arrow function
void funcaoB() => print("Função B!");

void funcaoC(int i) {
  print("Função C!");
  for (int i = 0; i < 10; i++) {
    print("Olá $i");
  }
}
