void main() {

  // Map
  // Coleção dinãmica e customizável de chaves e valores entre {}.
  // As chaves são únicas e os valores não se repetem
  // Ao tentar inserir dois valores com a mesma chave, os valores serão atualizados
  // Mas posso ter valores iguais em chaves diferentes

  linkedHashMap();
  listMap();

}

void linkedHashMap() {

  // LinkedHashMap = Map
  // {chave: valor}
  // A mesma chave atualiza o valor

  List<String> nomes = ["Mario", "Fernanda"];
  print(nomes); // [Mario, Fernanda]

  Map<int, String> nomesMap = nomes.asMap(); // Usa o indice da lista para ser a chave
  print(nomesMap); // {0: Mario, 1: Fernanda}

  nomesMap.forEach((chave, valor) => print("$chave: $valor")); // 0: Mario 1: Fernanda

  Map<String, dynamic> frutas = Map();
  frutas["laranja"] = "amarela";
  frutas["maca"] = "vermelha";
  print(frutas); // {laranja: amarela, maca: vermelha}

  print(frutas.containsKey("laranja")); // true
  print(frutas.containsKey("banana")); // false

  print(frutas.containsValue("vermelha")); // true
  print(frutas.containsValue("amarela")); // false

  print(frutas.length); // 2

  Map<String, dynamic> usuario = Map.from({"nome": "Mario", "idade": 30, "peso": 75.5});
  print(usuario); // {nome: Mario, idade: 30}
  usuario.update("nome", (valor) => "Julia"); // Atualiza o valor da chave "nome
  print(usuario); // {nome: Julia, idade: 30}
  usuario.update("peso", (valor) => 49.5, ifAbsent: () => "Indefinido"); // Caso a chave "peso" não exista, define como 'Indefinido'
  print(usuario); // {nome: Julia, idade: 30, peso: 49.5}
  usuario.removeWhere((chave, valor) => chave == "peso" && valor == 49.5); // Remove a chave "peso" se o valor for 49.5
  print(usuario); // {nome: Julia, idade: 30}
  usuario.update("peso", (valor) => 49.5, ifAbsent: () => "Indefinido"); // Caso a chave "peso" não exista, define como 'Indefinido'
  print(usuario); // {nome: Julia, idade: 30, peso: Indefinido}
  usuario.putIfAbsent("altura", () => 1.70); // Caso a chave "altura" nao exista, define como 1.70
  print(usuario); // {nome: Julia, idade: 30, peso: Indefinido, altura: 1.70}
  usuario.addAll({"sexo": "Feminino", "casado": true}); // Adiciona as chaves e valores
  print(usuario); // {nome: Julia, idade: 30, peso: Indefinido, altura: 1.70, sexo: Feminino, casado: true}
  print(usuario.keys); // {nome, idade, peso, altura, sexo, casado}
  print(usuario.values); // {Mario, 30, 49.5, 1.70, Feminino, true}
  print(usuario.entries); // {nome: Mario, idade: 30, peso: 49.5, altura: 1.70, sexo: Feminino, casado: true}

  Map<int, dynamic> numeros = {0: "zero", 1: "um", 2: "dois"};
  print(numeros); // {0: zero, 1: um, 2: dois}
  print(numeros.map((chave, valor) => MapEntry(chave, valor.toUpperCase()))); // {0: ZERO, 1: UM, 2: DOIS}
  for (var chave in numeros.keys) {
    print(numeros[chave]); // zero um dois
  } 
}

void listMap() {

  // Map
  // Transforma e seleciona os elementos de uma coleção criando uma nova do mesmo tamanho

  List<Map<String, dynamic>> carrinho = [
    {"nome": "Borracha", "preco": 3.45},
    {"nome": "Caderno", "preco": 7.5},
    {"nome": "Lápis", "preco": 8.98},
    {"nome": "Caneta", "preco": 17.25},
  ];
  var porcentagem = (desconto) => (valor) => desconto * valor["preco"]; // Closure
  final moeda = (e) => "R\$ ${e.toDouble().toStringAsFixed(2).replaceFirst(".", ",")}";
  List<String> precos1 = carrinho.map(porcentagem(0.9)).map(moeda).toList();
  print("Lista preço 1: $precos1"); // Lista preço 1: [R$ 3,11, R$ 6,75, R$ 8,08, R$ 15,53]

  List<String> precos2 = carrinho.map((e) => e.update("preco", (e) => e * 0.9)).map(moeda).toList();
  print("Lista preço 2: $precos2"); // Lista preço 2: [R$ 3,11, R$ 6,75, R$ 8,08, R$ 15,53]

  var precoMedio = carrinho.map((e) => e["preco"]).reduce((a, b) => a + b) / carrinho.length;
  print("Preço médio: $precoMedio"); // Preço médio: 8.3655

}