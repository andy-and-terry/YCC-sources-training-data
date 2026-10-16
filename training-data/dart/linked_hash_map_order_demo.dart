import 'dart:collection';

void main() {
  final m = LinkedHashMap<String, int>();
  m['z'] = 1;
  m['a'] = 2;
  m['m'] = 3;
  m['z'] = 10;
  print(m.keys.toList());
  print(m);
  m.remove('a');
  m['a'] = 99;
  print(m.keys.toList());
}
