int expensive() {
  print('computing...');
  return 42;
}

class Holder {
  late final int value = expensive();
  late String label;
}

void main() {
  final h = Holder();
  print('created');
  print(h.value);
  print(h.value);
  h.label = 'set';
  print(h.label);
}
