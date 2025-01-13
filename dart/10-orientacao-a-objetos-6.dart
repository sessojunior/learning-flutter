void main() {

  // Polimorfismo
  // É a capacidade de um objeto assumir várias formas

  Animal gato = Gato();
  gato.som(); // Miau!
  gato = Cachorro(); // Polimorfismo, muda a forma e comportamento de um objeto, assume outra forma
  gato.som(); // Auau!

  // Mixins
  // É uma forma de reutilizar código em várias classes, sem precisar usar herança
  // Permite que adicione comportamento específico, sem prcisar extender hierarquia de herança
  // São úteis quando deseja compartilhar o código entre classes que não tem uma relação hierárquica direta

  var minhaFoto = Foto("Minha foto", "Casa");
  print("Foto: ${minhaFoto.titulo} - Local: ${minhaFoto.local} "); // Foto: Minha foto - Local: Casa
  minhaFoto.compartilhar(); // Compartilhando titulo: Minha foto - data de criação: 2025-01-11 10:41:57.346177
}

// Polimorfismo

class Animal {
  void som() {
    print("Som do animal");
  }
}

class Gato extends Animal {
  @override
  void som() {
    print("Miau!");
  }
}

class Cachorro extends Animal {
  @override
  void som() {
    print("Auau!");
  }
}

// Mixins

mixin Compartilhavel {
  String titulo = "";
  DateTime dataCriacao = DateTime.now();

  void compartilhar() {
    print("Compartilhando titulo: $titulo - data de criação: $dataCriacao");
  }
}

mixin Deletavel {
  void deletar() {
    print("Deletando");
  }
}

class Foto with Compartilhavel, Deletavel {
  String titulo = "";
  String local = "";

  Foto(String this.titulo, this.local);
}
