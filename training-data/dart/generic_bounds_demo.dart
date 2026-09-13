class NumericBox<T extends num> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);

  T get max => _items.reduce((a, b) => a > b ? a : b);

  double get average =>
      _items.fold<num>(0, (sum, item) => sum + item) / _items.length;
}

T largest<T extends Comparable<T>>(List<T> items) {
  var best = items.first;
  for (final item in items) {
    if (item.compareTo(best) > 0) best = item;
  }
  return best;
}

void main() {
  final box = NumericBox<int>();
  for (final n in [3, 7, 2, 9, 5]) {
    box.add(n);
  }
  print(box.max);
  print(box.average);

  print(largest<String>(['pear', 'apple', 'watermelon']));
}
