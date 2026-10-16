import 'dart:collection';

void main() {
  final m = SplayTreeMap<String, int>()
    ..['pear'] = 3
    ..['apple'] = 5
    ..['mango'] = 1;
  print(m);
  print(m.firstKey());
  print(m.lastKey());
  print(m.firstKeyAfter('b'));

  final s = SplayTreeSet<int>.from([5, 1, 9, 3]);
  print(s);
}
