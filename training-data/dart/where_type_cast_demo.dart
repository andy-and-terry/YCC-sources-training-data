void main() {
  final mixed = <Object>[1, 'two', 3.0, 4, 'five', 6];

  // whereType filters and narrows the element type.
  final ints = mixed.whereType<int>().toList();
  final strings = mixed.whereType<String>();
  print(ints);
  print(strings.map((s) => s.length).toList());

  // cast is a lazy view and fails on first wrong element.
  final nums = <num>[1, 2, 3];
  final asInts = nums.cast<int>();
  print(asInts.reduce((a, b) => a + b));

  try {
    mixed.cast<int>().toList();
  } on TypeError {
    print('cast failed');
  }
}
