import 'dart:convert';

void main() {

  // JSON
  // Biblioteca JSON integrada ao Dart: dart:convert

  // Json -> Dart
  // Gera o código em Dart de um JSON
  // Link: https://javiercbk.github.io/json_to_dart/

  conversaoDireta();

}

void conversaoDireta() {

  // Conversão direta

  String jsonData = '''
  {
    "nome": "Fernanda",
    "idade": 35,
    "email": "nandas@gmail.com"
  }
  ''';

  // Decode

  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  print("parsedJson: $parsedJson"); // parsedJson: {nome: Fernanda, idade: 35, email: nandas@gmail.com}

  String nome = parsedJson["nome"];
  int idade = parsedJson["idade"];
  String email = parsedJson["email"];
  print("nome: $nome idade: $idade email: $email"); // nome: Fernanda idade: 35 email: nandas@gmail.com

  // Encode

  Map<String, dynamic> map = {
    "nome": nome,
    "idade": idade,
    "email": email
  };
  String toJson = jsonEncode(map);
  print("toJson: $toJson"); // toJson: {"nome":"Fernanda","idade":35,"email":"nandas@gmail.com"}
}

void conversaoObjeto() {

  // Conversão em objeto
  // Permite segurança de tipos, autocomplete e excessões de tempo de compilação

  String jsonData = '''
  [
    {
      "nome": "Fernanda",
      "idade": 35,
      "email": "nandas@gmail.com"
    },
    {
      "nome": "Mario",
      "idade": 31,
      "email": "marios@gmail.com"
    }
  ]
  ''';

  // Decode
  List<dynamic> parsedJson = jsonDecode(jsonData);
  print("parsedJson: $parsedJson"); // parsedJson: [{nome: Fernanda, idade: 35, email: nandas@gmail.com}, {nome: Mario, idade: 31, email: marios@gmail.com}]

}
