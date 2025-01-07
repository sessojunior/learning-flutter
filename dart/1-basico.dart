void main() {
  
  // Conceitos básicos de Dart
  print("Hello World!");

  // Variáveis básicas

  int idade = 10;
  String nome = "Mario";
  double altura = 1.80;

  print(idade);
  print(nome);
  print(altura);

  // Operadores aritméticos

  int n1 = 10;
  double n2 = 23.45;
  double r = n1 * n2;
  print(r);

  n1 += 10; // n1 = n1 + 10
  print(n1);
  n1 -= 10;
  print(n1);
  n1 *= 10; 
  print(n1);

  n2++; // Incremento
  print(n2);
  n2--;
  print(n2);

  // Tomadores de decisão

  int anos = 16;

  if (anos > 18) {
    print("Maior de idade");
  } else if (anos == 18) {
    print("Tem 18 anos");
  } else {
    print("Menor de idade");
  }

  anos % 2 == 0 ? print("Idade par") : print("Idade impar"); // Operador ternário

  // Operadores de comparação
  // ==, !=, >, >=, <, <=

  int n = 15;
  bool res = n == 15;
  print(res);
  print(n != 2);

  // Operadores lógicos
  // &&, ||, !

  bool b1 = true;
  bool b2 = false;
  print(b1 && b2); // e
  print(b1 || b2); // ou
  print(!b1); // not

  // If/else

  double nota = 5.3;
  if (nota >= 6.0) {
    print("Aprovado");
  } else if (nota >= 5.0) {
    print("Recuperação");
  } else {
    print("Reprovado");
  }

  // Operador ternário

  double nota2 = 8.5;
  String resultado = nota2 >= 6.0 ? "Aprovado" : "Reprovado";
  print(resultado);

  // Switch

  String cor = "amarelo";
  switch (cor) {
    case "vermelho":
      print("Cor vermelho");
      break;
    case "azul":
      print("Cor azul");
      break;
    case "amarelo":
      print("Cor amarelo");
      break;
    default:
      print("Cor desconhecida");
      break;
  }

  // While

  int i = 1;
  while (i <= 5) {
    print(i);
    i++;
  }

  // Do-while

  int j = 10;
  do {
    print(j);
    j++;
  } while (j <= 15);

  // For

  for (int k = 100; k <= 105; k++) {
    print(k);
  }
}