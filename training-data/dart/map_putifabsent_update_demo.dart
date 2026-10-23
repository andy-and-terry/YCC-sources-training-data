void main() {
  final counts = <String, int>{};

  for (final w in 'a b a c b a'.split(' ')) {
    counts.update(w, (v) => v + 1, ifAbsent: () => 1);
  }
  print(counts);

  final cache = <int, String>{};
  final first = cache.putIfAbsent(1, () => 'computed');
  final second = cache.putIfAbsent(1, () => 'ignored');
  print('$first $second');

  counts.updateAll((k, v) => v * 10);
  print(counts);

  counts.removeWhere((k, v) => v < 20);
  print(counts);
}
