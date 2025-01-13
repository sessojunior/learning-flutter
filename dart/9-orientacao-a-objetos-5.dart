void main() {
  
  // Classes abstratas
  // Define um contrato/modelo (padrão) que deve ser seguido nas outras classes
  // Como se fosse um contrato, classes implementadas a partir dessa classe devem seguir o modelo dessa classe

  // Instância de aluno
  // Observação: não é possível ter um objeto de uma classe abstrata. 
  // Não é possível instanciar a classe Pessoa, pois essa classe é abstrata
  Aluno aluno = Aluno();
  aluno.info(); // Nome: Desconhecido, idade: 0
  aluno.idade = 20;
  aluno.nome = "Joaquim";
  aluno.info(); // Nome: Joaquim, idade: 20
}

abstract class Pessoa {
  // Encapsulamento: uso de variáveis privadas para ocultar as variáveis fora da classe
  String? _nome = null;
  int? _idade = null;

  String? get nome => _nome;
  int? get idade => _idade;

  set nome(String? nome) => _nome = nome;
  set idade(int? idade) => _idade = idade;

  // A classe abstrata permite criar métodos sem implementação
  void info();
}

class Aluno extends Pessoa {
  @override
  void info() {
    print("Nome: $nome, idade: $idade");
  }
}