void main() {

  // Herança (extends)
  // Herda propriedades e metodos de uma classe pai para uma classe filha

  Veiculo veiculo1 = Veiculo();
  print(veiculo1.isFuncionando); // true
  veiculo1.acelerar();
  print(veiculo1.velocidade); // 20

  Carro carro1 = Carro();
  print(carro1.isFuncionando); // true
  carro1.acelerar();
  print(carro1.velocidade); // 20
  print(carro1.quantidadeRodas); // Propriedade apenas da classe filha: 4
  print(carro1.quantidadePortas); // Propriedade apenas da classe filha: 4
  carro1.exibirVelocidade(); // 20
  print(carro1.isFarolLigado); // false

  Gol gol1 = Gol();
  print(gol1.isFuncionando); // true
  gol1.acelerar();
  print(gol1.velocidade); // 60
  print(gol1.quantidadeRodas); // Propriedade apenas da classe filha: 4
  print(gol1.quantidadePortas); // Propriedade apenas da classe filha: 5
  gol1.buzinar();

  var cachorro = Cachorro("Pretinha", "Pastor alemão", "Fêmea", idade: 6, docil: true);
  print("nome: ${cachorro.nome}, raca: ${cachorro.raca}, sexo: ${cachorro.sexo}, idade: ${cachorro.idade}, docil: ${cachorro.docil}");
  cachorro
    ..dormir()
    ..alimentar()
    ..latir();
}

// Classe pai Veiculo
class Veiculo {
  int velocidade = 10;
  bool isFuncionando = true;
  bool isFarolLigado = false;

  void acelerar() => velocidade += 10;
}

// Classe filha Carro herda (extends) Veiculo
class Carro extends Veiculo {
  int quantidadePortas = 4;
  int quantidadeRodas = 4;

  // super referencia a classe pai
  // Numa classe herdada (extends), o super permite usar coisas da classe pai
  @override
  bool get isFarolLigado => super.isFarolLigado;

  // super - Quer dizer que quer usar coisas da classe pai
  void exibirVelocidade() => print(super.velocidade);
}

// Uso do extends e implements ao mesmo tempo
// Classe filha Gol herda (extends) Carro
// Gol implementa (implements) Alarme
class Gol extends Carro implements Alarme {
  int quantidadePortas = 5;
  void buzinar() {
    print("Bi! Bi!");
  }

  // @override - Diz ao dart que a intenção é de sobrescrever o método herdado
  // Mas @override não tem efeito sobre o código, ele apenas diz ao dart que queremos sobrescrever
  // Esta informação extra permite que o analisador forneça um aviso quando essa intenção não for satisfeita, 
  // onde um membro tem a intenção de substituir um membro de superclasse ou implementar um membro de interface, mas falha em fazê-lo.
  @override
  void acelerar() => velocidade += 50;

  // Relacionado a substituir a classe Alarme, pois foi implementado (implements)
  @override
  bool isLigado = true;
  @override
  void ligar() => isLigado = true;
}

class Alarme {
  bool isLigado = false;
  void ligar() => isLigado = true;
}

class Animal {
  int idade;
  bool docil;

  Animal(this.idade, {required this.docil});

  void dormir() {
    print("Dormindo...");
  }
}

class Mamiferos extends Animal {
  String sexo;

  Mamiferos(this.sexo, int idade, bool docil) : super(idade, docil: docil); // idade e docil herdam de Animal

  void alimentar() {
    print("Alimentando...");
  }
}

class Cachorro extends Mamiferos {
  String nome;
  String raca;

  Cachorro(this.nome, this.raca, String sexo, {required int idade, required bool docil}) : super(sexo, idade, docil);

  void latir() {
    print("Latindo...");
  }
}

