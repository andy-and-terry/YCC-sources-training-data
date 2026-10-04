void main() {
  final a = {1, 2, 3, 4};
  final b = {3, 4, 5, 6};

  print(a.union(b));
  print(a.intersection(b));
  print(a.difference(b));
  print(a.containsAll({1, 2}));

  final seen = <String>{};
  for (final w in ['x', 'y', 'x', 'z', 'y']) {
    if (!seen.add(w)) print('duplicate: $w');
  }
  print(seen.length);

  final sorted = ([5, 3, 5, 1, 3]..sort()).toSet().toList();
  print(sorted);
  a.removeWhere((n) => n.isEven);
  print(a);
}
