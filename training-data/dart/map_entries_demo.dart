void main() {
  final stock = {'apple': 3, 'pear': 0, 'plum': 7};

  for (final e in stock.entries) {
    print('${e.key} -> ${e.value}');
  }

  final doubled = stock.map((k, v) => MapEntry(k, v * 2));
  print(doubled);

  final inStock = Map.fromEntries(stock.entries.where((e) => e.value > 0));
  print(inStock);

  stock.putIfAbsent('fig', () => 1);
  stock.update('apple', (v) => v + 10);
  stock.update('kiwi', (v) => v + 1, ifAbsent: () => 5);
  stock.removeWhere((k, v) => v == 0);
  print(stock);

  final inverted = {for (final e in stock.entries) e.value: e.key};
  print(inverted);
  print(stock['missing'] ?? -1);
}
