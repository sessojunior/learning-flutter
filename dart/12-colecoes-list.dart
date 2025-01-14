import 'dart:math';

void main() {
  listForEach();
  listExpand();
  listMap();
  listEvery();
  listWhere();
  listReduce();
  listFold();

  // Objetos
  
  Pessoa p1 = Pessoa("Joaquim", "da Silva", identidade: 34524523452);
  print(p1.identidade); // 34524523452

  Pessoa p2 = Pessoa("Maria", "Gonçalves");
  print(p2.identidade); // Valor aleatório: 2034028

  List<Pessoa> pessoas = [p1, p2];
  pessoas.add(Pessoa("Rafael", "Siqueira", identidade: 356543));
  print(pessoas); // [Instance of 'Pessoa', Instance of 'Pessoa', Instance of 'Pessoa']

  for (var pessoa in pessoas) {
    print("Nome: ${pessoa.nome}, Sobrenome: ${pessoa.sobrenome}, Identidade: ${pessoa.identidade}"); // Nome: Joaquim, Sobrenome: da Silva, Identidade: 34524523452 Nome: Maria, Sobrenome: Gonçalves, Identidade: 27513104 Nome: Rafael, Sobrenome: Siqueira, Identidade: 356543
  }
}

listForEach() {
  var array = [0, 2.5, 5, 7.25, 10];

  // forEach() executa uma função para cada item da lista

  array.forEach((item) {
    print(item);
  });

  List<int> inteiros = [1, 5, 10];
  List<double> reais = [1.5, 5.5, 10.5];
  List<bool> booleans = [true, false, true];
  List<String> frutas = ["Banana", "Laranja", "Manga"];

  print(inteiros); // [1, 5, 10]
  print(reais); // [1.5, 5.5, 10.5]
  print(booleans); // [true, false, true]
  print(frutas); // [Banana, Laranja, Manga]

  frutas.insert(2, "Abacaxi"); // Insere o item Abacaxi na posição 2
  print(frutas); // [Banana, Laranja, Abacaxi, Manga]

  frutas.add("Limão"); // Adiciona o item Limão ao final da lista
  print(frutas); // [Banana, Laranja, Abacaxi, Manga, Limão]

  frutas.remove("Laranja"); // Remove o item Laranja da lista
  print(frutas); // [Banana, Abacaxi, Manga, Limão]

  frutas.removeLast(); // Remove o último item da lista
  print(frutas); // [Banana, Abacaxi, Manga]

  frutas.removeAt(1); // Remove o item na posição 1 (Abacaxi) da lista
  print(frutas); // [Banana, Manga]

  print(frutas.elementAt(1)); // Retorna o item na posição 1: Manga
  print(frutas); // [Banana, Manga]

  print(frutas.contains("Banana")); // Verifica se a lista contém o item Banana: true
  print(frutas.contains("banana")); // Verifica se a lista contém o item banana (minúsculo): false
  print(frutas.contains("Morango")); // Verifica se a lista contém o item Morango: false
  
  List<num> numeros = List.from(inteiros)
    ..addAll(reais)
    ..shuffle() // Embaralha os itens da lista
    ..sort(); // Ordena os itens da lista

  print(numeros); // [1, 1.5, 5, 5.5, 10, 10.5]

  List<String> listaPreenchida = List.filled(3, "Elemento");
  print(listaPreenchida); // [Elemento, Elemento, Elemento]

  List<double> listaPrecos = List.generate(4, (item) => double.parse(((item + 1) * Random().nextDouble()).toStringAsFixed(2)));
  print(listaPrecos); // [0.0, 0.3813728759501245, 1.7002458662752689, 0.10159401672973889]
}

void listExpand() {

  // expand() cria uma nova lista com o resultado de uma função

  var lista = [
    [1, 2, 3],
    [4, 5, 6],
  ];
  print(lista); // [[1, 2, 3], [4, 5, 6]]

  List<dynamic> listaExpandida = lista.expand((item) => item).toList();
  print(listaExpandida); // [1, 2, 3, 4, 5, 6]

  List<dynamic> listaDuplicada = listaExpandida.expand((e) => [e, e]).toList();
  print(listaDuplicada); // [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6]

  List<dynamic> listaDinamica = [1, 4, 10] + [2, 5, 11] + [3, 6, 12]; // Concatena as listas
  print(listaDinamica); // [1, 4, 10, 2, 5, 11, 3, 6, 12]
  listaDinamica.sort();
  print(listaDinamica); // [1, 2, 3, 4, 5, 6, 10, 11, 12]

  List<int> inteiros = [1, 4, 9];
  listaDinamica = [0, inteiros, 6, 8]; // Concatena as listas
  print(listaDinamica); // [0, [1, 4, 9], 6, 8]
  listaDinamica = [0, ...inteiros, 6, 8]; // Usa o operador spread (...) para concatenar as listas
  print(listaDinamica); // [0, 1, 4, 9, 6, 8]
  
  List<dynamic> doubles = [1.5, 5.5, 10.5];
  listaDinamica = [...[], ...inteiros, if (doubles is List<double>) ...doubles]; // Usando if dentro da lista para verificar 
  print(listaDinamica); // [1, 4, 9] 

  listaDinamica = [0, for (var inteiro in inteiros) inteiro, 7, 12]; // Usando for dentro da lista para percorrer a lista
  print(listaDinamica); // [0, 1, 4, 9, 7, 12]
}

void listMap() {

  // map() cria uma nova lista com o resultado de uma função

  List<String> frutas = ["Banana", "Laranja", "Manga"];
  print(frutas); // [Banana, Laranja, Manga]

  List<String> frutasMaiusculas = frutas.map((fruta) => fruta.toUpperCase()).toList();
  print(frutasMaiusculas); // [BANANA, LARANJA, MANGA]

  List<int> inteiros = [1, 2, 3];
  print(inteiros); // [1, 2, 3]

  var quadrado = (int inteiro) => inteiro * inteiro;
  List<dynamic> quadrados = inteiros.map(quadrado).toList();
  print(quadrados); // [1, 4, 9]
}

void listEvery() {

  // every() verifica se todos os elementos da lista atendem a uma determinada condição

  List<String> frutas = ["Banana", "Laranja", "Manga"];
  bool todosFrutasMaiusculas = frutas.every((fruta) => fruta.toUpperCase() == fruta);
  print(todosFrutasMaiusculas); // false

  List<int> inteiros = [1, 2, 3, 4, 5];
  bool todosInteirosPares = inteiros.every((inteiro) => inteiro % 2 == 0);
  print(todosInteirosPares); // false

  List<double> reais = [1.5, 2.5, 3.5, 4.5, 5.5];
  bool todosReaisInteiros = reais.every((real) => real % 1 == 0);
  print(todosReaisInteiros); // false

  List<String> textos = List.from(["Amanda", "Antonio", "Artur", "Aline"]);
  bool todosTextosContemA = textos.every((texto) => texto.contains("A"));
  print(todosTextosContemA); // true
}

void listWhere() {

  // where() cria uma nova lista com os elementos que atendem a uma determinada condição

  List<int> idades = [6, 18, 48, 14, 32, 56];
  List<int> maioresDeIdade = idades.where((idade) => idade >= 18).toList();
  print(maioresDeIdade); // [18, 48, 32, 56]

  // singleWhere() retorna um único elemento que atende a condição, se nenhuma for encontrada, retorna o orElse
  var criancas = idades.singleWhere((item) => item < 12, orElse: () => 0); 
  print(criancas); // 6

  // firstWhere() retorna o primeiro elemento que atende a condição, se nenhuma for encontrada, retorna o orElse
  var menoresDeIdade = idades.firstWhere((item) => item < 18, orElse: () => 0); 
  print(menoresDeIdade); // 6

  // lastWhere() retorna o ultimo elemento que atende a condição, se nenhuma for encontrada, retorna o orElse
  var adultos = idades.lastWhere((item) => item >= 18, orElse: () => 0); 
  print(adultos); // 56

  List<String> nomes = ["Amanda", "Rafael", "Artur", "Lucas"];
  List<String> comecaComA = nomes.where((nome) => nome.startsWith("A")).toList();
  print(comecaComA); // [Amanda, Aline]
}

void listReduce() {

  // reduce() reduz uma lista a um único elemento
  // Ao interagir com os elementos, o índice 0 se torna o anterior, o índice 1 se torna o atual

  List<int> inteiros = [1, 2, 3, 4, 5];
  print(inteiros); // [1, 2, 3, 4, 5]
  int somaInteiros = inteiros.reduce((anterior, atual) => anterior + atual);
  print(somaInteiros); // 15

  List<int> numerosPares = List.generate(6, (item) => item * 2);
  print(numerosPares); // [0, 2, 4, 6, 8, 10]
  int somaNumerosPares = numerosPares.reduce((anterior, atual) => anterior + atual);
  print(somaNumerosPares); // 30

  List<int> idades = [6, 18, 67, 14, 32, 56];
  print(idades); // [6, 18, 67, 14, 32, 56]
  int maisVelho = idades.reduce((anterior, atual) => anterior > atual ? anterior : atual);
  print(maisVelho); // 67
  int maisNovo = idades.reduce((anterior, atual) => anterior < atual ? anterior : atual);
  print(maisNovo); // 6
  int somaIdades = idades.reduce((anterior, atual) => anterior + atual);
  print(somaIdades); // 193
  double mediaIdades = somaIdades / idades.length;
  print(mediaIdades); // 32.166666666666664
  print(mediaIdades.toStringAsFixed(2)); // 32.17
}

void listFold() {

  // fold() reduz uma lista a um único elemento
  // A diferença do fold() para o reduce() é que ele aceita um valor inicial
  // O valor inicial se torna o anterior e o indice 0 se torna o atual

  List<int> inteiros = [1, 2, 3, 4, 5];
  print(inteiros); // [1, 2, 3, 4, 5]
  int somaInteiros = inteiros.fold(10, (anterior, atual) => anterior + atual); // Inicia a soma com o valor 10
  print(somaInteiros); // 25

  List<int> numerosPares = List.generate(6, (item) => item * 2);
  print(numerosPares); // [0, 2, 4, 6, 8, 10]
  int valorInicial = 20;
  int somaNumerosPares = numerosPares.fold(valorInicial, (anterior, atual) => anterior + atual); // Inicia a soma com o valor inicial 20
  print(somaNumerosPares); // 50
}

class Pessoa {
  String nome, sobrenome;
  int? _identidade;

  Pessoa(this.nome, this.sobrenome, {int? identidade}) {
    this._identidade = identidade == null ? Random().nextInt(99999999) : identidade;
  }

  get identidade => _identidade;
}