void main() {

  // Orientação a objetos

  // implements

  // Quando usa o implements, precisa ter o que a classe pai tem
  // Isso não é opcional, precisa implementar toda a classe
  // Vai ter que ter todos os métodos, todas as propriedades

  // Não é possível usar o super com o implements, apenas com o extends

  Pai pai1 = Pai();
  print(pai1.ola); // Olá
  pai1.andar(); // Estou andando - pai

  Filha filha1 = Filha();
  print(filha1.ola); // Olá filho
  filha1.andar(); // Estou andando - filho
  filha1.correr(); // Estou correndo - filho
}

class Pai {
  String ola = "Olá";

  void andar() => print("Estou andando - pai");
}

class Filha implements Pai {
  // Usando o implements, precisa ter o que a classe pai tem
  @override
  String ola = "Olá filho";
  @override
  void andar() => print("Estou andando - filho");

  // Pode ter outras coisas que o Pai não tem
  void correr() => print("Estou correndo - filho");
}
