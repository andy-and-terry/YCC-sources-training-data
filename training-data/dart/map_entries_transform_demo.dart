void main() {
  final prices = {'apple': 1.2, 'pear': 0.8, 'melon': 3.5};

  final doubled = prices.map((k, v) => MapEntry(k.toUpperCase(), v * 2));
  print(doubled);

  final cheap = Map.fromEntries(prices.entries.where((e) => e.value < 2));
  print(cheap);

  final names = ['ann', 'bob', 'cy'];
  final lengths = {for (final n in names) n: n.length};
  print(lengths);

  prices.putIfAbsent('kiwi', () => 2.0);
  prices.update('pear', (v) => v + 0.1);
  prices.update('fig', (v) => v, ifAbsent: () => 4.0);
  print(prices);

  final inverted = {for (final e in lengths.entries) e.value: e.key};
  print(inverted);

  prices.removeWhere((k, v) => v > 3);
  print(prices.keys.toList()..sort());
}
