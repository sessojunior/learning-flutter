import 'Conta.dart';

void main() {

  // Classes
  // São objetos em Dart, com atributos (variáveis - propriedades) e métodos (funções - métodos)
  // Padrão: PascalCase

  // Instância de bicicleta
  final Bicicleta bike1 = Bicicleta(); // final é do objeto, mas as propriedades não, podem ser mudadas
  bike1.montar(); // Montando...
  bike1.andar(); // Estou andando...
  print(bike1.cor); // azul
  bike1.cor = "vermelho";
  print(bike1.cor); // vermelho
  print(bike1.tamanho); // 1.15
  print(bike1.isAndando()); // true
  //bike1.marca = "Chingling"; // Isso irá dar um erro, pois a propriedade marca é final, na propriedade (não é possível mudar o valor)

  // Instância de carro
  final Carro car1 = Carro("azul", 4.15);
  car1.ligar(); // Ligando...
  car1.andar(); // Estou andando...
  print(car1.cor); // azul
  print(car1.tamanho); // 4.15
  print(car1.isAndando()); // true

  // Instância de moto
  final Moto moto1 = Moto(tamanho: 1.45, cor: "verde"); // Parâmetros nomeados obrigatórios (required)
  moto1.ligar(); // Ligando...
  moto1.andar(); // Estou andando...
  print(moto1.cor); // verde
  print(moto1.tamanho); // 1.45
  print(moto1.isAndando()); // true
  print(moto1.area()); // 50

  // Getter
  print(moto1.altura); // int get altura: 5
  print(moto1.largura); // int get largura: 10

  // Setter
  moto1.altura = 600; // void set altura(int value) { _altura = value; }
  print(moto1.altura); // 600

  print(moto1.area()); // 6000

  // Propriedades estáticas: variáveis estáticas
  // São variáveis que não é preciso instanciar
  
  Constantes util = Constantes(); // Instanciando a classe
  print(util.apiKey); // Para pegar a apiKey, precisa ter instanciado a classe Constantes para obter o valor: dgs3434fdgg354yhe67hbeyteghtb34w5
  
  // Usando uma propriedade static, não é preciso instanciar a classe para acessar a propriedade
  print(Constantes.database); // database é uma propriedade static, pode ser acessada diretamente por Constantes: loja
  print(Constantes.host); // host é uma propriedade static, pode ser acessada diretamente por Constantes: localhost

  // Funções estáticas
  // São funções que não é preciso instanciar

  print(util.somar1(10, 20)); // 30

  // Usar um método sem instanciar a classe
  print(Constantes.somar2(10, 20)); // 30
  Constantes.ola(nome: "Maria"); // Olá Maria!

  // Instância de pessoa
  final Pessoa pessoa1 = Pessoa();
  pessoa1.nome = "Maria";
  pessoa1.idade = 30;
  pessoa1.info(); // Nome: Maria, idade: 30

  // Operador de cascata
  final Pessoa pessoa2 = Pessoa();
  pessoa2
    ..nome = "Lucas"
    ..idade = 14
    ..info(); // Nome: Lucas, idade: 14

  // Instância de usuario
  final Usuario usuario1 = Usuario();
  usuario1.usuario = "sessojunior";
  usuario1.senha = "1234567";
  print(usuario1.usuario); // sessojunior
  usuario1.autenticar(); // Usuário ou senha incorretos

  // Instância de conta
  // Arquivo de classe externa Conta.dart
  final Conta conta1 = Conta();
  print(conta1.nome); // Mario Junior
  print(conta1.numeroConta); // Numero aleatório de 0 a 9999
  print(conta1.saldo); // 0.0
  conta1.depositar(100.00);
  print(conta1.saldo); // 100.0
  conta1.sacar(60.00); 
  print(conta1.saldo); // 40.0
}

class Pessoa {
  String? nome;
  int idade = 0;

  void info() {
    print("Nome: $nome, idade: $idade");
  }
}

class Usuario {
  late String usuario;
  late String senha;

  void autenticar() {
    // Simulando recuperar dados do banco de dados
    String usuarioBanco = "sessojunior";
    String senhaBanco = "123456";

    if (this.usuario == usuarioBanco && this.senha == senhaBanco) {
      print("Usuário autenticado");
    } else {
      print("Usuário ou senha incorretos");
    }
  }
}

// Funções e variáveis estáticas
class Constantes {
  final String apiKey = "dgs3434fdgg354yhe67hbeyteghtb34w5"; // não estático

  // Variáveis estáticas
  // Propriedade static: permite o acesso diretamente por Constantes
  static final String host = "localhost";
  static final String database = "loja"; 

  int somar1(int a, int b) {
    return a + b;
  }

  // Funções estáticas
  static int somar2(int a, int b) {
    return a + b;
  }
  static void ola({required String nome}) {
    // Coisas não estáticas só acessam coisas não estáticas fora da classe. 
    // Dentro da classe você consegue usar coisas estáticas
    // Exemplos:
    //print(apiKey); // Irá dar erro, porque apiKey é uma variável não estática
    print(host); // Consegue acessar porque host é static

    print("Olá $nome!"); // obtido através de parâmetro
  }
}

class Bicicleta {
  
  // Variáveis: Propriedades
  String cor = "azul";
  double tamanho = 1.15;
  final String marca = "Monark"; // final aqui é da propriedade, não pode ser mudada

  // Funções: Métodos
  void montar() {
    print("Ligando...");
  }
  void andar() {
    print("Estou andando...");
  }
  bool isAndando() {
    return true;
  }
}

class Carro {
  // Variáveis: Propriedades
  final String cor;
  final double tamanho;

  // Construtor: deve ter o mesmo nome da classe
  // Eles são iniciados quando instanciamos a classe, podendo fazer configurações iniciais
  //Carro(this.cor, this.tamanho);
  Carro(this.cor, this.tamanho) {
    print(this); // Instance of 'Carro'
    print("Classe Carro inicializada...");
  }

  // Funções: Métodos
  void ligar() {
    print("Ligando...");
  }
  void andar() {
    print("Estou andando...");
  }
  bool isAndando() {
    return true;
  }
}

class Moto {
  // Variáveis: Propriedades
  final String cor;
  final double tamanho;

  // Variáveis privadas: somente são acessíveis dentro do próprio arquivo (ela não é privada em nível de classe, só em nível de arquivo)
  // Colocando underline _ antes do nome da variável, torna ela privada
  int _altura = 5; 
  final int _largura = 10;

  // Getter
  int get altura => _altura;
  int get largura => _largura;

  // Setter
  set altura(int altura) {
    if (altura > 10) {
      _altura = altura;
    }
  }

  // Função construtora
  // Parâmetros nomeados obrigatórios (required)
  Moto({required this.cor, required this.tamanho});

  int area() {
    return _altura * _largura;
  }

  // Funções: Métodos
  void ligar() {
    print("Ligando...");
  }
  void andar() {
    print("Estou andando...");
  }
  bool isAndando() {
    return true;
  }
}