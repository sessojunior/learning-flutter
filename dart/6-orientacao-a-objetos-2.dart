void main() {
  
  // Orientação a objetos

  // Encapsuladores: get e set
  // São usados para proteger os atributos e variáveis
  // Get - é usado para acessar
  // Set - é usado para alterar
  // Atributos ou variáveis com underline _ são privados. Ex: _saldo

  Usuario usuario1 = Usuario("Julia", "123456");
  print(usuario1.nome); // Julia
  print(usuario1.senha); // 123456
  usuario1
    ..alteracao = true
    ..senha = "654321";
  print(usuario1.senha); // 654321
}

class Usuario {
  bool alteracao = false;
  String nome;
  late String _senha;

  // get
  String get senha => this._senha;

  // set
  void set senha(String senha) {
    if (alteracao) {
      this._senha = senha;
      print("Senha alterada!");
    } else {
      print("Acesso negado!");
    }
  }

  Usuario(this.nome, String senha) {
    this._senha = senha;
  }
}

