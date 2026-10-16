void main() {
  final it = [10, 20, 30].iterator;
  while (it.moveNext()) {
    print(it.current);
  }

  final gen = Iterable.generate(5, (i) => i * 2);
  print(gen.toList());
  print(gen.last);
  print(gen.contains(6));
  print(gen.singleWhere((n) => n == 8));
}
