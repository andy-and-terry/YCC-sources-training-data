Iterable<int> naturals() sync* {
  var n = 1;
  while (true) {
    print('  producing $n');
    yield n++;
  }
}

void main() {
  final lazy = naturals().where((n) => n.isOdd).map((n) => n * n).take(3);
  print('built pipeline');
  print(lazy.toList());

  final nested = [
    [1, 2],
    [3],
    [4, 5, 6],
  ];
  print(nested.expand((l) => l).toList());
  print([1, 2, 3].expand((n) => [n, n * 10]).toList());

  print((1.to(5)));
  print(List.generate(5, (i) => i * i).skip(1).takeWhile((n) => n < 20));
  print([3, 1, 2].fold<int>(0, (a, b) => a * 10 + b));
}

extension on int {
  Iterable<int> to(int end) => List.generate(end - this + 1, (i) => this + i);
}
