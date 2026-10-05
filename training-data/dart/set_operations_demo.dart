void main() {
  final a = {1, 2, 3, 4, 5};
  final b = {4, 5, 6, 7};

  print('union: ${a.union(b)}');
  print('intersection: ${a.intersection(b)}');
  print('difference: ${a.difference(b)}');
  print('contains all: ${a.containsAll({1, 2})}');

  final seen = <String>{};
  for (final item in ['a', 'b', 'a', 'c', 'b']) {
    if (!seen.add(item)) {
      print('duplicate: $item');
    }
  }

  final unique = [3, 1, 3, 2, 1].toSet().toList()..sort();
  print(unique);
}
