void main() {
  
  // Conceitos básicos de Dart
  print("Hello World!");

  // Variáveis básicas
  // Padrão: camelCase

  var valorA = "Fusca";
  print(valorA);

  var valorB = 10, valorC = 20; // Várias variáveis na mesma linha (mesmo tipo)
  print(valorB + valorC); // 30
  var valorD = 10, valorE = "Ford"; // Várias variáveis na mesma linha (tipos diferentes)
  print(valorD); // 10
  print(valorE); // Ford

  // Concatenar strings
  print("Ferrari"
  "Mercedes"
  "BMW"); // FerrariMercedesBMW
  print("Ferrari" "Mercedes" "BMW"); // FerrariMercedesBMW
  print("Ferrari" + "Mercedes" + "BMW"); // FerrariMercedesBMW
  print("Ferrari\nMercedes\nBMW");

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

  var a, b;
  a = 3;
  b = ++a; // a = 4 (a = a + 1), b = 4 (incrementa o "a" antes da atribuição)
  print("a: $a, b: $b"); // a: 4, b: 4

  var c, d;
  c = 3;
  d = c++; // c = 4 (c = c + 1), d = 3 (incrementa o "c" só depois da atribuição)
  print("c: $c, d: $d"); // c: 4, d: 3

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
  //print(b1 || b2); // ou
  print(!b1); // not

  // Operador ??

  int? x, y, z;
  y = 20;
  z = null;
  x = z ?? y; // x = z, mas se z for nulo, x = y
  print("x: $x");

  // if else

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

  // switch
  // Uso do break é desnecessário a partir do Dart 3.0: https://dart.dev/tools/linter-rules/unnecessary_breaks
  // Só use break quando precisar interromper antes do case. Ver exemplo no link.
  String cor = "amarelo";
  switch (cor) {
    case "vermelho":
      print("Cor vermelho");
      // break; 
    case "azul":
      print("Cor azul");
      // break;
    case "amarelo":
      print("Cor amarelo");
      // break;
    default:
      print("Cor desconhecida");
      // break;
  }

  // while

  int i = 1;
  while (i <= 5) {
    print(i);
    i++;
  }

  // do while

  int j = 10;
  do {
    print(j);
    j++;
  } while (j <= 15);

  // For

  for (int k = 100; k <= 105; k++) {
    print(k);
  }

  // for in

  List<String> cores = ["vermelho", "azul", "amarelo"];
  for (String cor in cores) {
    print(cor);
  }

  // forEach

  cores.forEach((item) => print(item));
}