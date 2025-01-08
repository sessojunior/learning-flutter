void main() {

  // Exceptions (Exceções) e Try Catch

  // Try Catch
  // Serve para não crashar o código (parar de funcionar), caso ocorra um erro
  try {
    int resultado = 100 ~/ 0; // Resultado da divisão inteira por 0 (~/) 
    print(resultado); // Erro
  } catch (e) {
    print(e.runtimeType); // Erro (UnsupportedError): IntegerDivisionByZeroException
    print("Erro: $e"); // Tratamento do erro
  }

  print("Continuou a execução..."); // Sem o try/catch, o programa iria crashar (parar de funcionar)

  // Exceptions
  try {
    double valor = double.parse("50.2"); // O parse converte a string em um double
    print(valor); // 50.2
    double valor2 = double.parse("9.7abc"); // O parse converte a string em um double
    //double? valor2 = double.tryParse("9.7abc"); // Alternativa para evitar a exception. O tryParse tenta converter, caso não consiga, converte em null 
    print(valor2); // Erro: FormatException
    int resultado = 100 ~/ 0; // Resultado da divisão inteira por 0 (~/) 
    print(resultado); // Erro (UnsupportedError): IntegerDivisionByZeroException
  } on FormatException catch (e) { // Trata o erro, caso o erro seja do tipo FormatException
    print("Erro de formato: $e"); // Erro de formato: FormatException: Invalid double, 9.7abc
  } on UnsupportedError { // Trata o erro, caso o erro seja do tipo UnsupportedError
    print("Erro ao dividir por zero"); 
  } catch (e) { // Quando não sabe que erro pode dar
    print(e.runtimeType);
    print("Erro: $e"); // Tratamento do erro caso não caia em nada das exceções anteriores
  } finally {
    print("Finalizou"); // Sempre vai ser executado, independente se rodou com sucesso ou deu algum erro
  }
  
  // Exceptions personalizadas

  try {
    funcao(-2);
  } on ParametroInvalido {
    print("Erro de parâmetro inválido");
  } catch(e) {
    print(e);
  }

  // Enumeradores
  // É uma forma de especificar valores limitados para uma variável

  StatusPagamento status = StatusPagamento.pago;

  // Clicar na lâmpada após clicar em switch e em Add missing switch cases para criar os casos automaticamente
  switch (status) {
    case StatusPagamento.pendente:
      print("Pagamento pendente");
    case StatusPagamento.pago:
      print("Pagamento pago");
    case StatusPagamento.reembolsado:
      print("Pagamento reembolsado");
  }
  print(status.name); // pago
  print(status.index); // 1
  print(StatusPagamento.values); // [StatusPagamento.pendente, StatusPagamento.pago, StatusPagamento.reembolsado]
  print(StatusPagamento.values[2]); // StatusPagamento.reembolsado
  print(StatusPagamento.values[2].name); // reembolsado

  // Final x Const

  // Const
  // Constante - não permite alterar o valor depois em hipótese nenhuma
  // Não é necessário especificar o tipo de variável, já que o Dart já detecta a partir do valor
  
  //const String nome = "Mario";
  const nome1 = "Mario";
  print(nome1); // Mario
  //const int idade = 10 + 30;
  const idade = 10 + 30;
  print(idade); // 40
  //const List<String> nomes = ["Mario", "José", "Rafael"];
  const nomes = ["Mario", "José", "Rafael"];
  print(nomes); // [Mario, José, Rafael]

  // final
  // final - semelhante a constantes, não permite alterar o valor depois em hipótese alguma
  // final - não precisa ser especificado em tempo de compilação, pode ser especificado depois
  final String nome2;
  nome2 = "Fernanda"; // Valor atribuído em tempo de execução, porém uma vez atribuído, esse valor não pode ser modificado mais
  print(nome2); // Fernanda
  final String nome3 = "Maria Julia"; // Valor atribuído em tempo de compilação
  print(nome3); // Maria Julia
  //const DateTime agora = DateTime.now(); // No momento da compilação, não dá pra obter o horário, por isso não é possível usar o const e sim o final
  final DateTime agora = DateTime.now();
  print(agora); // 2025-01-08 09:22:52.006658

  // Operadores Cascata (..)
  // Usado para fazer várias operações na mesma linha (em um só objeto pode chamar vários métodos)
  // Sem o operador de cascata, a função pode retornar um void e não ser possível realizar outra operação em seguida
  // Ao colocar o .., ele retorna o objeto a esquerda, ao invés de void, permitindo realizar outras operações
  // É muito útil em cenários onde retorna void

  List<String> nomes2 = [];
  // Obtém o objeto nomes2 e não o resultado da operação add()
  nomes2..add("Mario")..add("Fernanda"); // Utiliza o operador de cascata (..) para fazer a operação: [Mario, Fernanda]
  print(nomes2);
  List<int> idades = [];
  idades
    ..add(15)
    ..add(18)
    ..add(21)
    ..remove(18);
  print(idades); // [15, 21]

}

// Exceptions personalizadas
void funcao(int x) {
  if (x <= 0) {
    throw ParametroInvalido();
  }
  print(x);
}
class ParametroInvalido implements Exception {
  String toString() {
    return "Não pode passar um valor menor ou igual a zero";
  }
}

// Enumeradores
enum StatusPagamento {
  pendente, pago, reembolsado
} // Sempre que declarar um enum NÃO colocar um ponto-e-virgula	no final