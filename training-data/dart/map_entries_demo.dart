void main() {
  final prices = {'apple': 1.2, 'pear': 0.8, 'kiwi': 2.5};

  for (final MapEntry(:key, :value) in prices.entries) {
    print('$key costs $value');
  }

  final doubled = prices.map((k, v) => MapEntry(k, v * 2));
  print(doubled);

  final expensive = Map.fromEntries(prices.entries.where((e) => e.value > 1.0));
  print(expensive);

  final sorted = prices.entries.toList()..sort((a, b) => a.value.compareTo(b.value));
  print(sorted.map((e) => e.key).toList());

  prices.putIfAbsent('plum', () => 3.0);
  prices.update('apple', (v) => v + 1);
  prices.update('fig', (v) => v, ifAbsent: () => 4.0);
  prices.removeWhere((k, v) => v > 3.5);
  print(prices);
}
