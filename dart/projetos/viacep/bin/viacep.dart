// Biblioteca HTTP: https://pub.dev/packages/http
// Via CEP: https://viacep.com.br/

// Status Codes: https://github.com/waldemarnt/http-status-codes

import 'dart:convert'; // Para uso do jsonDecode

import 'package:http/http.dart' as http; // Importante: colocar como " as http" para ficar acessível

Future<void> main() async {
  String url = 'https://viacep.com.br/ws/27521020/json/';

  /*
    {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "unidade": "",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "estado": "São Paulo",
      "regiao": "Sudeste",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
    }
  */

  try {
    var response = await http.get(Uri.parse(url));
    print("Status: ${response.statusCode}"); // Status: 200
    /*
    Status: 200
    Status: {
      "cep": "27521-020",
      "logradouro": "Rua Altamiro O'Reilly",
      "complemento": "",
      "unidade": "",
      "bairro": "Vila Julieta",
      "localidade": "Resende",
      "uf": "RJ",
      "estado": "Rio de Janeiro",
      "regiao": "Sudeste",
      "ibge": "3304201",
      "gia": "",
      "ddd": "24",
      "siafi": "5883"
    }
    */
    if (response.statusCode == 200) {
      //print("Status: ${response.body}");

      // Decode

      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      //print(parsedJson); 
      Cep cep = Cep.fromJson(parsedJson);
      print('parsedJson: $parsedJson'); // parsedJson: {cep: 27521-020, logradouro: Rua Altamiro O'Reilly, complemento: , unidade: , bairro: Vila Julieta, localidade: Resende, uf: RJ, estado: Rio de Janeiro, regiao: Sudeste, ibge: 3304201, gia: , ddd: 24, siafi: 5883}
      print('CEP: ${cep.cep}'); // CEP: 27521-020
      print('Logradouro: ${cep.logradouro}'); // Logradouro: Rua Altamiro O'Reilly
    
      // Encode

      Map<String, dynamic> mapCepJson = cep.toJson();
      String cepJson = jsonEncode(mapCepJson);
      print('toJson: $cepJson'); // toJson: {"cep":"27521-020","logradouro":"Rua Altamiro O'Reilly","complemento":"","unidade":"","bairro":"Vila Julieta","localidade":"Resende","uf":"RJ","estado":"Rio de Janeiro","regiao":"Sudeste","ibge":"3304201","gia":"","ddd":"24","siafi":"5883"}
    } else {
      throw Exception('Erro ao obter o CEP. Status: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }

}

// Gerado e modificado com o site: JSON to Dart
// Site: https://javiercbk.github.io/json_to_dart/
class Cep {
  String? cep;
  String? logradouro;
  String? complemento;
  String? unidade;
  String? bairro;
  String? localidade;
  String? uf;
  String? estado;
  String? regiao;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  Cep(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.unidade,
      this.bairro,
      this.localidade,
      this.uf,
      this.estado,
      this.regiao,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  Cep.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    unidade = json['unidade'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    estado = json['estado'];
    regiao = json['regiao'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['unidade'] = unidade;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['estado'] = estado;
    data['regiao'] = regiao;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}