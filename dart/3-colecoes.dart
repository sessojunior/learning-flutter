import 'dart:convert'; // Importa a biblioteca para uso com JSON 

void main() {

  // Variáveis dinâmicas

  // var
  // Apesar de ser possível utilizar o var, recomenda-se não utilizá-lo
  var nome = "Mario"; // O var obtém o tipo da variável de acordo com o valor que ele recebeu
  print(nome);

  // dynamic
  // O tipo dynamic permite alterar o tipo da variável, também não muito recomendado
  // É útil em situações muito específicas apenas, não é uma boa prática de programação
  // Não é seguro utilizar o dynamic porque você não sabe o tipo, daí não saberia por exemplo,
  // se poderia fazer um incremento ou converter o valor da variável para maiúsculo, causando, 
  // um crash na execução do programa
  dynamic variavel = 3;
  variavel = "Olá";
  variavel = bool;
  print(variavel);

  // num
  // Aceita tanto números inteiros, quanto números com vírgula
  num numero = 3;
  print(numero);
  num numero2 = 1.2;
  print(numero2);
  numero2 = 4;
  print(numero2);

  // Listas

  // Lista do tipo dinâmico List<dynamic> ou List apenas omitindo <dynamic> 
  // Aceita qualquer tipo de variável
  List itens = ["Mario", 2.5, true, "José", "Marcos"]; 
  print(itens);
  List<dynamic> itens2 = ["Rafaela", 67.2, false, 34];
  print(itens2);

  // Lista com tipo: String, int, bool etc.
  // Permite somente um tipo de variável na lista
  List<String> nomes = ["Rafaela", "Maria", "João", "Pedro", "Joaquim"];
  print(nomes);
  List<int> idades = [34, 12, 43];
  print(idades);

  // Obtendo informações da lista

  print(nomes.length); // Quantidade de itens na lista
  print(nomes.first); // Pegar o primeiro item da lista
  print(nomes[0]); // Pegar o primeiro item da lista
  print(nomes.last); // Pegar o ultimo item da lista
  print(nomes[4]); // Pegar o quinto item (0, 1, 2, 3, 4) da lista

  // Funções de lista

  nomes.add("Luiz"); // Adicionar um item na lista
  print(nomes);
  nomes.addAll(["Juliana", "Rosa", "Tadeu"]); // Adicionar varios itens na lista
  print(nomes);
  nomes.insert(2, "Bernardo"); // Adiciona um item na posição 2 (como terceiro item) da lista
  print(nomes);
  print(nomes.contains("Juliana")); // Retorna true se o item Juliana existe na lista
  print(nomes.contains("Tereza")); // Retorna true se o item Tereza existe na lista
  print(nomes.indexOf("Maria")); // Retorna o indice do item Maria na lista
  print(nomes);
  print(nomes.remove("Maria")); // Remove o item Maria da lista e retorna true se o item foi encontrado para ser removido
  print(nomes);
  print(nomes.removeAt(5)); // Remove o item na posição 5 da lista e retorna o item removido
  print(nomes);
  nomes.shuffle(); // Embaralha a lista, retorna void
  print(nomes);
  nomes.clear(); // Limpa a lista
  print(nomes);

  // Iterações em listas

  List<String> nomes2 = ["Rafaela", "maria julia", "João", "Pedro", "Joaquim"];

  // for
  for (int i = 3; i < nomes2.length; i++) { // For para percorrer a lista a partir da posição 3 (int i = 3)
    print(nomes2[i].toUpperCase()); // Imprime o item na posição i da lista
  }

  // for in
  for (String nome in nomes2.sublist(2)) { // For para percorrer a lista a partir da posição 2 (usando sublist)
    print(nome.toLowerCase()); // Imprime o item da lista
  }

  // forEach
  nomes2.forEach((item) => print(item.toUpperCase())); // For para percorrer a lista e imprimir o item
  nomes2.sublist(2).forEach((item) => print(item.toUpperCase())); // For para percorrer a lista a partir da posição 2 e imprimir o item

  // Outras funções de lista

  List<String> nomes3 = List.filled(4, "Nenhum"); // Cria uma lista com 4 itens com o valor "Nenhum"
  print(nomes3); // [Nenhum, Nenhum, Nenhum, Nenhum]
  List<String> nomes4 = List.generate(5, (index) => "Item $index"); // Cria uma lista com 5 itens com o valor "Item 0", "Item 1", "Item 2", "Item 3", "Item 4"
  print(nomes4); // [Item 0, Item 1, Item 2, Item 3, Item 4]
  print(nomes3.isEmpty); // Retorna true se a lista estiver vazia: false
  print(nomes4.isNotEmpty); // Retorna true se a lista estiver preenchida: true
  List<int> numeros = List.generate(10, (item) => (item + 1) * 10); // Cria uma lista com 10 itens com o valor do item multiplicado por 10
  print(numeros); // [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
  print(numeros.any((item) => item % 20 == 0)); // Retorna true se algum item da lista for divisível por 20: true
  print(numeros.every((item) => item % 2 == 0)); // Retorna true se todos os itens da lista forem divisiveis por 2: true
  print(numeros.where((item) => item % 20 == 0).toList()); // Retorna uma lista com os itens divisiveis por 20: [20, 40, 60, 80, 100]
  print(numeros); // [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
  print(numeros.firstWhere((item) => item % 15 == 0)); // Retorna o primeiro item da lista que seja divisiveis por 15: 30
  print(numeros.lastWhere((item) => item % 60 == 0)); // Retorna o ultimo item da lista que seja divisiveis por 60: 60
  print(numeros.where((item) => item % 20 == 0).toList()); // Retorna todos os itens da lista que forem divisiveis por 20: [20, 40, 60, 80, 100]
  print(numeros); // [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
  print(numeros.map((item) => item + 1)); // Retorna uma lista com o item + 1: [11, 21, 31, 41, 51, 61, 71, 81, 91, 101]
  print(numeros); // [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

  // Listas no Null safety

  List<int> numeros1 = [56,3, 98, 32, 17, 89, 23, 12, 45, 78]; 
  print(numeros1); // [56, 3, 98, 32, 17, 89, 23, 12, 45, 78]
  numeros1.sort(); // Ordena a lista em ordem crescente
  print(numeros1); // [3, 12, 17, 23, 32, 45, 56, 78, 89, 98]
  numeros1.sort((a, b) => b.compareTo(a)); // Ordena a lista em ordem decrescente
  print(numeros1); // [98, 89, 78, 56, 45, 32, 23, 17, 12, 3]
  numeros1.add(400); // Adiciona o valor 4 ao final da lista
  print(numeros1); // [98, 89, 78, 56, 45, 32, 23, 17, 12, 3, 400]
  numeros1.insert(0, 2); // Insere o valor 2 na primeira posição da lista
  print(numeros1); // [2, 98, 89, 78, 56, 45, 32, 23, 17, 12, 3, 400]
  List<String> lista1 = ["Tomate", "Abacate", "Banana", "Laranja", "Maçã", "Uva"]; // Cria uma lista de String com 5 itens com valores não null
  print(lista1); // [Tomate, Abacate, Banana, Laranja, Maçã, Uva]
  lista1.sort((a, b) => a.compareTo(b)); // Ordena a lista por ordem alfabética
  print(lista1); // [Abacate, Banana, Laranja, Maçã, Tomate, Uva]
  lista1.sort((a, b) => b.compareTo(a)); // Ordena a lista por ordem alfabética invertida
  print(lista1); // [Uva, Tomate, Maçã, Laranja, Banana, Abacate]
  List<String?> lista2 = ["Ford", "Mercedes", null, "Fiat"]; // Cria uma lista de String com 3 itens incluindo valores null, pois possui o ? após o String
  print(lista2); // [Ford, Mercedes, null, Fiat]
  List<String>? listaNull1 = null; // Lista null porque tem o ? depois do tipo: List<String>? e foi declarada como null. Mas, null != []
  print(listaNull1); // null
  List<String>? listaNull2; // Lista null porque tem o ? depois do tipo: List<String>? mas não foi preciso declarar um valor inicial
  print(listaNull2); // null
  List<String>? listaVazia = []; // Lista vazia e pode ser null porque tem o ? depois do tipo: List<String>?
  print(listaVazia); // []
  listaVazia.add("Valor 1"); // Adiciona um item na lista. Isso é possível porque a lista é vazia e não null. Uma lista null não poderá receber valores.
  print(listaVazia); // [Valor 1]
  if (listaNull1 != null) { // Se a lista for diferente de null, ele irá imprimir o tamanho dela
    print(listaNull1); // Não irá imprimir porque a lista é null
  }
  List<String?>? listaNull3; // Lista null podendo ter valores String ou null
  print(listaNull3); // null

  // Mapas

  // Conjunto de chave e valor.
  // Importante: não pode ter chaves duplicadas (com o mesmo nome), mas pode ter valores iguais em chaves diferentes (pode ter chaves com o mesmo valor)
  Map<int, String> ddds1 = {
    11: "Sao Paulo", // Não permite colocar null, nos valores da inicialização, mas pode retornar null caso consulte uma chave que não existe
    19: "Campinas",
    41: "Curitiba",
  };
  print(ddds1); // {11: Sao Paulo, 19: Campinas, 41: Curitiba}
  print(ddds1[11]); // Consulta pela chave 11. Imprime: Sao Paulo
  print(ddds1[41]); // Consulta pela chave 41. Imprime: Curitiba
  print(ddds1[1000]); // Consulta pela chave 1000 (que não existe). Quando a chave não existe, retorna null. Imprime: null
  String? cidade1 = ddds1[1000]; // Consulta pela chave 1000 (que não existe). Quando a chave não existe, retorna null. Imprime: null
  print(cidade1); // null
  String? cidade2 = ddds1[41]; // Consulta pela chave 41. Deve ter ? em String? porque pode ser um retorno null
  print(cidade2); // Curitiba
  Map<int, String?> ddds2 = {
    11: "São Paulo",
    19: "Campinas",
    41: null, // Permite colocar null, pois tem String? na inicialização
  };
  print(ddds2); // {11: São Paulo, 19: Campinas, 41: null}
  print(ddds2.length); // Imprime a quantidade de itens que tem no mapa: 3
  print(ddds2.keys); // Imprime as chaves do mapa: (11, 19, 41)
  print(ddds2.values); // Imprime os valores do mapa: (São Paulo, Campinas, null)
  ddds2[61] = "Brasilia"; // Adiciona um item no mapa
  print(ddds2); // {11: São Paulo, 19: Campinas, 41: null, 61: Brasilia}
  ddds2[61] = "Desconhecido"; // Altera o item no mapa
  print(ddds2); // {11: São Paulo, 19: Campinas, 41: null, 61: Desconhecido}
  ddds2.remove(41); // Remove o item no mapa
  print(ddds2); // {11: São Paulo, 19: Campinas, 61: Desconhecido}
  ddds2.removeWhere((key, value) => value == "Campinas"); // Remove o item no mapa com o valor Campinas
  print(ddds2); // {19: Campinas, 61: Desconhecido}
  ddds2.forEach((key, value) => print("$key - $value")); // Imprime os itens do mapa: 11 - São Paulo, 61 - Desconhecido
  print(ddds2.values); // Imprime os valores do mapa: (São Paulo, Desconhecido)
  print(ddds2.keys); // Imprime as chaves do mapa: (11, 61)
  print(ddds2.containsKey(11)); // Verifica se a chave 11 existe no mapa: true
  print(ddds2.containsValue("Desconhecido")); // Verifica se o valor Desconhecido existe no mapa: true
  print(ddds2.isEmpty); // Verifica se o mapa está vazio: false
  print(ddds2.isNotEmpty); // Verifica se o mapa não está vazio: true

  // Funções de Mapas

  ddds2.forEach((key, value) => print("Chave: $key - Valor: $value")); // Imprime os itens do mapa: Chave: 11 - Valor: São Paulo, Chave: 61 - Valor: Desconhecido
  ddds2.addAll({21: "Rio de Janeiro", 31: "Belo Horizonte"}); // Adiciona mais itens no mapa
  print(ddds2); // {11: São Paulo, 19: Campinas, 61: Desconhecido, 21: Rio de Janeiro, 31: Belo Horizonte}
  ddds2.removeWhere((key, value) => value == "Desconhecido"); // Remove o item no mapa com o valor Desconhecido
  print(ddds2); // {11: São Paulo, 19: Campinas, 21: Rio de Janeiro, 31: Belo Horizonte}

  // Null Assertion (!)
  // Pode-se colocar apenas em casos onde temos certeza de que o valor não irá ser null de forma alguma

  String cidade3 = ddds1[41]!; // Operador null assertion (!). Deve ter ! na frente de uma variável que pode ser null
  print(cidade3); // Curitiba
  String? cidade4 = ddds1[11] ?? "Desconhecido"; // Consulta pela chave 41. Deve ter ?? em String?? porque pode ser um retorno null
  print(cidade4); // Sao Paulo

  // Mapas no Null Safety
  // Importante: não é permitido colocar uma chave como null: Map<String?, String> ddds5 = {null: "São Paulo"}; - Isso não é permitido

  Map<String, String?> ddds3 = {
    "SP": "São Paulo",
    "RJ": null, // Permite colocar null, pois tem String? na inicialização
  };
  print(ddds3); // {SP: São Paulo, RJ: null}
  String? cidade5 = ddds3["SP"] ?? "Desconhecido"; // Consulta pela chave SP. Deve ter ?? em String?? porque pode ser um retorno null
  print(cidade5); // São Paulo

  Map<String, String>? ddds4 = null; // Colocando ? depois do tipo: Map<String, String>? para indicar que pode ser null
  print(ddds4); // null
  ddds4 = {
    "SP": "São Paulo",
    "MG": "Belo Horizonte",
  };
  print(ddds4); // {SP: São Paulo, MG: Belo Horizonte}

  // JSON

  String DadosDoUsuario() {
    return """
      {
        "nome": "Mario",
        "sobrenome": "Sesso",
        "senha": "123456",
        "idade": 42,
        "cursos": [
          {
            "nome": "Dart",
            "nivel": "Intermediário",
            "ano": 2023
          },
          {
            "nome": "Flutter",
            "nivel": "Avançado",
            "ano": 2024
          }
        ],
        "endereco": {
          "logradouro": "Rua 1",
          "cidade": "São Paulo",
          "estado": "SP"
        }
      }
    """;
  }
  String dadosDoUsuario = DadosDoUsuario(); // Obtém o retorno dos dados do usuário, mas em um formato que não é JSON ainda
  print(dadosDoUsuario);

  Map<String, dynamic> jsonDados = json.decode(dadosDoUsuario); // Converte o valor recebido em um Map
  print(jsonDados);
  print(jsonDados["nome"]); // Mario
  print(jsonDados["idade"]); // 42
  print(jsonDados["cursos"]); // [{nome: Dart, nivel: Intermediário, ano: 2023}, {nome: Flutter, nivel: Avançado, ano: 2024}]
  print(jsonDados["cursos"][0]); // {nome: Dart, nivel: Intermediário, ano: 2023}
  print(jsonDados["cursos"][0]["nome"]); // Dart
  print(jsonDados["endereco"]); // {logradouro: Rua 1, cidade: São Paulo, estado: SP}
  print(jsonDados["endereco"]["cidade"]); // São Paulo

  // Records
  final pessoa1 = (id: 1, nome: "Mario", idade: 42); 
  print(pessoa1); // (id: 1, nome: Mario, idade: 42)
  print(pessoa1.nome); // Mario

  final pessoa2 = (2, "Lucas", 15);
  print(pessoa2); // (2, Lucas, 15)
  print(pessoa2.$2); // 15

  // Pattern matching

  final list1 = [5, 4, 3, 2, 1];
  final [a, b, c, d, e] = list1;
  print("a: $a, b: $b, c: $c, d: $d, e: $e"); // a: 5, b: 4, c: 3, d: 2, e: 1
  
  final list2 = ["a", "b", "c", "d", "e"];
  //final [a2, b2] = list2; // Daria um erro, porque não corresponde a quantidade de elementos
  final [a2, b2, ...c2] = list2; // Utilizar o operador ... (spread) para pegar o restante
  print("a2: $a2, b2: $b2, c2: $c2"); // a2: a, b2: b, c2: [c, d, e]

  final pessoaFinal1 = PessoaFinal("Mario", 42);
  final PessoaFinal(idade: age, nome: name) = pessoaFinal1;
  print("Nome: $name, idade: $age"); // Correspondência de variáveis: Nome: Mario, idade: 42
}

class PessoaFinal {
  final String nome;
  final int idade;
  
  PessoaFinal(this.nome, this.idade);}
}