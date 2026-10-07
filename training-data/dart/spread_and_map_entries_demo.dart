void main() {
  final prices = {'apple': 1.2, 'pear': 0.8, 'kiwi': 2.5};

  final discounted = prices.map((k, v) => MapEntry(k, v * 0.9));
  print(discounted.map((k, v) => MapEntry(k, v.toStringAsFixed(2))));

  final expensive = Map.fromEntries(prices.entries.where((e) => e.value > 1));
  print(expensive);

  final sorted = prices.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  print(sorted.map((e) => e.key).toList());

  final merged = {...prices, 'plum': 1.9, 'pear': 0.7};
  print(merged);

  prices.putIfAbsent('fig', () => 3.0);
  prices.update('kiwi', (v) => v + 1);
  prices.removeWhere((k, v) => v < 1);
  print(prices);

  final inverted = {for (final e in prices.entries) e.value: e.key};
  print(inverted);
}
