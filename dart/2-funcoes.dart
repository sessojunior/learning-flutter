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

  // Funções de variáveis

  num pi = 3.1415;
  print(pi); // 3.1415
  print(pi.floor()); // Arredonda para baixo: 3
  print(pi.round()); // Arredonda para o inteiro mais perto: 3
  print(pi.ceil()); // Arredonda para cima: 4
  print(pi.clamp(3, 3.1)); // Limita o valor de pi entre 3 e 3.1: 3.1
  print(pi.compareTo(3)); // Compara o valor de pi com 3: -1 se for inferior, 0 se for igual e 1 se for maior: -1
  print(pi.remainder(2)); // Retorna o resto da divisão de pi por 2: 1.1415
  print(pi.toInt()); // Converte pi para inteiro: 3
  print(2.toDouble()); // Converte 2 para double: 2.0
  print(pi.toString()); // Converte pi para string: 3.1415 
  print(pi.toStringAsFixed(2)); // Converte pi para string com 2 casaS decimaIS: 3.14
  print(pi.truncate()); // Trunca o valor de pi: 3
  print(pi.isNegative); // Verifica se pi é negativo: false
  print(pi.isFinite); // Verifica se pi é finito: true
  print(pi.isInfinite); // Verifica se pi é infinito: false
  print(12.gcd(16)); // Retorna o maior divisor comum (MDC) de 12 e 16: 4
  
  String nome = "Mario";
  String nomeCompleto = " \n Mario Antonio\n Sesso Junior\n ";
  print(nome); // Mario
  print(nomeCompleto); // \n Mario Antonio\n Sesso Junior\n
  print(nome.toLowerCase()); // Converte para minúsculo: mario
  print(nome.toUpperCase()); // Converte para maiúsculo: MARIO
  print(nomeCompleto.trim()); // Remove os espaços em branco: Mario Antonio\n Sesso Junior
  print(nomeCompleto.split(" ")); // Divide a string por espaços em branco: [Mario, Antonio, Sesso, Junior]
  print(nome.split("")); // Divide a string em letras: [M, a, r, i, o]
  print(nome.substring(2, 5)); // Retorna uma substring de 2 a 8: rio
  print(nome.startsWith("M")); // Verifica se a string começa com "M": true
  print(nome.startsWith("io", 3)); // Verifica se a string começa com "io" a partir da posição 3: true
  print(nome.endsWith("rio")); // Verifica se a string termina com "rio": true
  print("Fernanda".replaceAll("a", "*")); // Substitui todas as ocorrencias de "a" por "*": Fern*nd*
  print("Fernanda".replaceFirst("a", "#")); // Substitui a primeira ocorrencia de "a" por "#": Fern#nda
  print("Fernanda".replaceFirst("a", "o", 7)); // Substitui a primeira ocorrencia de "a" por "o" a partir da posição 7: Fernando
  print(nome.replaceRange(3, 5, "@")); // Substitui a substring de 3 a 5 por "@": Mar@
  print(nomeCompleto.trim().split(" ")); // Remove os espaços em branco e junta as palavras com espaços em branco: [Mario, Antonio, Sesso, Junior]
  print(nomeCompleto.contains("Sesso")); // Verifica se a string contém "Sesso": true
  print(nome.indexOf("rio")); // Retorna a posição da primeira ocorrencia de "rio": 2
  print(nome.length); // Retorna o tamanho da string: 5
  print(nome.compareTo("Mario")); // Compara a string com "Mario": 0, pois é igual
  print(nome.compareTo("MARIO")); // Compara a string com "MARIO": 1, pois é diferente
  print(nome.compareTo("Lucas")); // Compara a string com "Lucas": -1, pois é diferente
  print(nome.isEmpty); // Verifica se a string é vazia: false
  print("".isEmpty); // Verifica se a string é vazia: true
  print(" ".isEmpty); // Verifica se a string é vazia: false
  print(double.parse("145.8957")); // Converte a string para double: 145.8957
  print(int.parse("19")); // Converte a string para int: 19
  print(nomeCompleto.lastIndexOf("o")); // Retorna a posição inicial da última correspondência padrão nesta string: 28, pois Junior contém a letra "o" e o último caractere está na posição 28
  
  String sopa = "sopa de letrinhas";
  int index = sopa.indexOf(" de ");
  print(index); // 4
  print(sopa.substring(index)); //  de letrinhas
  print("A sopa é ${sopa.substring(index).trim()}"); // A sopa é de letrinhas

  print("7".padLeft(4, "0")); // Adiciona zeros a esquerda: 0007
  print("32".padLeft(4, "0")); // Adiciona zeros a direita: 0032
  print("65".padRight(5, "X")); // Adiciona 'X' a direita: 65XXX

  num numero = 3.14;
  print(numero is double); // Verifica se a variável é do tipo double: true
  print(numero is int); // Verifica se a variável é do tipo int: false

  // Funções com parâmetros posicionais

  final (int idadeD, String nomeD) = funcaoD();
  print("Idade: $idadeD, Nome: $nomeD");

  final dadosE = funcaoE();
  print(dadosE);
  print("Idade: ${dadosE.idade}, Nome: ${dadosE.nome}");

  // Arrow function

  String saudacaoArrow() => "Saudação de arrow function";
  print(saudacaoArrow());

  var variavelAnonima = () => print("Variável anonima"); 
  variavelAnonima();
  var variavelAnonimaComParametro = (mensagem) => print("Variável anonima com parâmetro: $mensagem"); 
  variavelAnonimaComParametro("Mensagem da variável");

  // Closures
  // Função declarada dentro do corpo de outra função
  // Pode retornar as variáveis locais e da função superior
  funcaoClosures();

}

// Função Closures
void funcaoClosures() {
  // Null Function(String) saudacao
  var saudacao = (String nome) {
    // void Function(String) mensagem 
    var mensagem = (String complemento) => print("Olá $nome! $complemento");
    mensagem("Tudo bem?");
  };

  saudacao("Mario"); // Olá Mario! Tudo bem?
  print(saudacao); // Closure: (String) => Null
}

// Função com parâmetros posicionais
(int idade, String nome) funcaoD() {
  return (42, "Mario");
}

// Função com parâmetros nomeados
({int idade, String nome}) funcaoE() {
  return (idade: 42, nome: "Mario");
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
