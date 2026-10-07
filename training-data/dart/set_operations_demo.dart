void main() {
  final a = {1, 2, 3, 4};
  final b = {3, 4, 5};

  print(a.union(b));
  print(a.intersection(b));
  print(a.difference(b));
  print(a.containsAll({1, 2}));

  final seen = <int>{};
  final dups = [1, 2, 2, 3, 3, 3].where((n) => !seen.add(n)).toList();
  print(dups);

  final sorted = {...a, ...b}.toList()..sort((x, y) => y.compareTo(x));
  print(sorted);
}
