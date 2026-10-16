T firstWhereOr<T>(List<T> items, bool Function(T) test, T fallback) {
  for (final item in items) {
    if (test(item)) return item;
  }
  return fallback;
}

Map<K, List<T>> groupBy<T, K>(Iterable<T> items, K Function(T) key) {
  final out = <K, List<T>>{};
  for (final item in items) {
    out.putIfAbsent(key(item), () => []).add(item);
  }
  return out;
}

void main() {
  print(firstWhereOr([1, 3, 6, 7], (n) => n.isEven, -1));
  print(firstWhereOr<String>(['a'], (s) => s == 'z', 'none'));
  print(groupBy(['apple', 'avocado', 'banana'], (s) => s[0]));
}
