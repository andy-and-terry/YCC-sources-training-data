void main() {
  final prices = {'apple': 1.2, 'pear': 0.8, 'kiwi': 2.5};

  final doubled = prices.map((k, v) => MapEntry(k, v * 2));
  print(doubled);

  final expensive = Map.fromEntries(prices.entries.where((e) => e.value > 1));
  print(expensive);

  final sortedKeys = prices.keys.toList()..sort((a, b) => prices[b]!.compareTo(prices[a]!));
  print(sortedKeys);

  prices.update('apple', (v) => v + 1);
  prices.putIfAbsent('fig', () => 3.0);
  prices.removeWhere((k, v) => v < 1);
  print(prices);

  final inverted = {for (final e in prices.entries) e.value: e.key};
  print(inverted);
}
