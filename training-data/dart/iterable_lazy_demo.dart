void main() {
  var evaluated = 0;
  final lazy = [1, 2, 3, 4, 5, 6].map((n) {
    evaluated++;
    return n * n;
  });
  print('evaluated before use: $evaluated');

  final firstTwoBig = lazy.where((n) => n > 4).take(2).toList();
  print(firstTwoBig);
  print('evaluated after: $evaluated');

  final naturals = Iterable<int>.generate(1000000, (i) => i + 1);
  print(naturals.skip(10).take(3).toList());
  print(naturals.takeWhile((n) => n < 6).fold<int>(0, (a, b) => a + b));
  print([1, 2, 3].expand((n) => [n, n * 10]).toList());
  print(['a', 'b'].followedBy(['c']).join());
}
