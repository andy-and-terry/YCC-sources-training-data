void main() {
  final a = {1, 2, 3, 4, 5};
  final b = {4, 5, 6, 7};

  print(a.union(b));
  print(a.intersection(b));
  print(a.difference(b));
  print(a.containsAll({1, 2}));
  print(a.add(3));
  print(a.add(10));
  print(a.length);

  final unique = [3, 1, 3, 2, 1].toSet().toList()..sort();
  print(unique);

  final symmetric = a.union(b).difference(a.intersection(b));
  print(symmetric);
  a.removeWhere((n) => n.isEven);
  print(a);
}
