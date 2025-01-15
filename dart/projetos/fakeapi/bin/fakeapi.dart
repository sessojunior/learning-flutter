// Biblioteca HTTP: https://pub.dev/packages/http
// Fake API: https://jsonplaceholder.typicode.com/

// Status Codes: https://github.com/waldemarnt/http-status-codes

import 'dart:convert'; // Para uso do jsonDecode

import 'package:fakeapi/models/Posts.dart';
import 'package:http/http.dart' as http; // Importante: colocar como " as http" para ficar acessível

import 'package:fakeapi/models/Users.dart';

void main() {
  //jsonGet();
  //jsonPost();
  //jsonPut();
  //jsonPatch();
  jsonDelete();
}

jsonGet() async {

  // GET

  String url = 'https://jsonplaceholder.typicode.com/users';
  
  try {
    var response = await http.get(Uri.parse(url));
    //print("statusCode: ${response.statusCode}"); // statusCode: 200
    if (response.statusCode == 200) {
      //print("body: ${response.body}"); // body: [{"id": 1, "name": ...

      // Decode
      List<dynamic> parsedJson = jsonDecode(response.body);
      //print("parsedJson: $parsedJson"); // parsedJson: [{id: 1, name: Leanne Graham, username: Bret, ...

      // Acessar objeto
      var obj = Users.fromJson(parsedJson);
      //print("Acessar objeto: ${obj.users.map((e) => e.address?.geo?.lat).toList()}");

      // Encode
      List<dynamic> map = obj.toJson();
      String toJson = jsonEncode(map);
      print("toJson: $toJson"); // toJson: [{"id":1,"name":"Leanne Graham","username":"Bret","email": ...

    } else {
      throw Exception("Erro ao obter os dados.");
    }
  } catch(e) {
    print("Exceção: $e");
  }
}

void jsonPost() async {

  // POST

  String url = 'https://jsonplaceholder.typicode.com/posts';

  // Decode
  Map<String, dynamic> parsedJson = {
    "title": "Postagem do Mario", 
    "body": "Funcionou!", 
    "userId": 1,
  };

  var obj = Posts.fromJson(parsedJson);

  // Acessar objeto
  print("Acessar objeto: ${obj.title}");

  // Encode
  String toJson = jsonEncode(obj);

  try {
    var response = await http.post(Uri.parse(url), body: toJson, headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print("statusCode: ${response.statusCode}"); // statusCode: 201
    if (response.statusCode == 201) {
      print("body: ${response.body}"); // body: {"title":"Postagem do Mario","body":"Funcionou!","userId":1,"id":101}
    } else {
      throw Exception("Erro ao enviar os dados.");
    }
  } catch(e) {
    print("Exceção: $e");
  }
}

void jsonPut() async {

  // PUT

  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  // Decode
  Map<String, dynamic> parsedJson = {
    "id": 1,
    "title": "Postagem do Mario alterada", 
    "body": "Funcionou a alteração!", 
    "userId": 1,
  };

  var obj = Posts.fromJson(parsedJson);

  // Acessar objeto
  print("Acessar objeto: ${obj.title}");

  // Encode
  String toJson = jsonEncode(obj);

  try {
    var response = await http.put(Uri.parse(url), body: toJson, headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print("statusCode: ${response.statusCode}"); // statusCode: 201
    if (response.statusCode == 200) {
      print("body: ${response.body}"); // body: {"title":"Postagem do Mario","body":"Funcionou!","userId":1,"id":101}
    } else {
      throw Exception("Erro ao enviar os dados.");
    }
  } catch(e) {
    print("Exceção: $e");
  }
}

void jsonPatch() async {

  // PATCH

  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  // Decode
  Map<String, dynamic> parsedJson = {
    "id": 1,
    "title": "Postagem do Mario alterada com PATCH", 
    "userId": 1,
  };

  var obj = Posts.fromJson(parsedJson);

  // Acessar objeto
  print("Acessar objeto: ${obj.title}");

  // Encode
  String toJson = jsonEncode(obj);

  try {
    var response = await http.patch(Uri.parse(url), body: toJson, headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print("statusCode: ${response.statusCode}"); // statusCode: 201
    if (response.statusCode == 200) {
      print("body: ${response.body}"); // body: {"title":"Postagem do Mario","body":"Funcionou!","userId":1,"id":101}
    } else {
      throw Exception("Erro ao enviar os dados.");
    }
  } catch(e) {
    print("Exceção: $e");
  }
}

void jsonDelete() async {

  // DELETE

  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    var response = await http.delete(Uri.parse(url), headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print("statusCode: ${response.statusCode}"); // statusCode: 201
    if (response.statusCode == 200) {
      print("Deletado com sucesso!");
      print("body: ${response.body}"); // body: {"title":"Postagem do Mario","body":"Funcionou!","userId":1,"id":101}
    } else {
      throw Exception("Erro ao deletar os dados.");
    }
  } catch(e) {
    print("Exceção: $e");
  }
}