import 'dart:collection'; // Para usar o LinkedHashSet e o HashSet

void main() {

  // Set
  // É uma coleção de elementos únicos e ordenados entre chaves {}, não tem acesso a índice 

  linkedHashSet();
  hashSet();
  splayTreeSet();
}

linkedHashSet() {

  // LinkedHashSet
  
  Set<int?> setInt = Set();
  print("Implementação: ${setInt.runtimeType}"); // Implementação: _Set<int>

  setInt.add(1);
  setInt.add(2);
  setInt.add(2); // Ignorado
  setInt.add(3);
  setInt.add(4);
  setInt.add(null);
  setInt.add(5);
  setInt.add(1); // Ignorado
  print(setInt); // Lista sem elementos duplicados: {1, 2, 3, 4, null, 5}
  setInt.remove(2);
  print(setInt); // {1, 3, 4, null, 5}
  print(setInt.toList()); // [1, 3, 4, null, 5]

  for (var item = 0; item < setInt.length; item++) {
    print(setInt.elementAt(item)); // 1, 3, 4, null, 5
  }

  for (var elemento in setInt) {
    print(elemento); // 1, 3, 4, null, 5
  }

  setInt.forEach((e) => print(e)); // 1, 3, 4, null, 5

  Set<int> listaA = {0, 1, 2, 3, 4};
  Set<int> listaB = {3, 4, 5, 6, 7};

  print("União: ${listaA.union(listaB)}"); // União: {0, 1, 2, 3, 4, 5, 6, 7}
  print("Diferença: ${listaA.difference(listaB)}"); // Diferença: {0, 1, 2}
  print("Interseção: ${listaA.intersection(listaB)}"); // Interseção: {3, 4}
  print("lookup: ${listaA.lookup(0)}"); // Retorna o elemento passado como parâmetro para a função. Lookup: 0
  print("lookup: ${listaA.lookup(5)}"); // Retorna o elemento passado como parâmetro para a função. Lookup: null (Como não tem na listaA o elemento 5, retorna null)

}

hashSet() {

  // HashSet
  // É uma coleção de elementos únicos e desordenados entre chaves {}, tem acesso a índice

  HashSet<String> hashSet1 = HashSet();
  HashSet<int> hashSet2 = HashSet(); 
  HashSet<int> hashSet3 = HashSet();
  print("Implementação: ${hashSet1.runtimeType}"); // Implementação: _HashSet<String>

  hashSet1.add("A");
  hashSet1.add("B");
  hashSet1.add("C");
  hashSet1.add("D");
  print("$hashSet1"); // {A, B, C, D}
  hashSet2.add(1);
  hashSet2.add(2);
  hashSet2.add(3);
  print("$hashSet2"); // {1, 2, 3}
  hashSet3.add(11);
  hashSet3.add(22);
  hashSet3.add(33);
  print("$hashSet3"); // {11, 22, 33}

  for (var i = 0; i < hashSet1.length; i++) {
    print(hashSet1.elementAt(i)); // Não tem acesso a índice, mas pode usar elementAt: A, D, C, B
  }

  for (var item in hashSet2) {
    print(item); // 1, 2, 3
  }

  hashSet3.forEach((e) => print(e)); // 33, 11, 22
}

void splayTreeSet() {

  // SplayTreeSet
  // Organiza automatiamente os elementos em ordem crescente
  // Por ser uma árvore de comparações, não pode conter elementos null

  SplayTreeSet<String> splayTreeSet1 = SplayTreeSet();
  print("Implementação: ${splayTreeSet1.runtimeType}"); // Implementação: _SplayTreeSet<String>

  splayTreeSet1.add("F");
  splayTreeSet1.add("G");
  splayTreeSet1.add("A");
  splayTreeSet1.add("D");
  print("$splayTreeSet1"); // {A, D, F, G}
}