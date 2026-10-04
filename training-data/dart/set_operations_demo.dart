void main() {
  final a = {1, 2, 3, 4};
  final b = {3, 4, 5};

  print(a.union(b));
  print(a.intersection(b));
  print(a.difference(b));
  print(a.containsAll({1, 2}));
  print(a.add(2));
  print(a.add(9));

  final unique = [3, 1, 3, 2, 1].toSet().toList()..sort();
  print(unique);

  final frozen = Set<int>.unmodifiable(a);
  try {
    frozen.add(100);
  } on UnsupportedError catch (e) {
    print('cannot modify: ${e.runtimeType}');
  }
}
