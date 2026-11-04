class MinStack<T extends Comparable<T>> {
  final List<(T, T)> _items = [];

  void push(T v) {
    final m = _items.isEmpty || v.compareTo(_items.last.$2) < 0 ? v : _items.last.$2;
    _items.add((v, m));
  }

  T pop() => _items.removeLast().$1;
  T get min => _items.last.$2;
}

void main() {
  final s = MinStack<int>();
  for (final v in [5, 3, 7, 2]) {
    s.push(v);
  }
  print(s.min);
  s.pop();
  print(s.min);
}
