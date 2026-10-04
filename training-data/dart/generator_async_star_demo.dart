Stream<int> countdown(int from) async* {
  for (var i = from; i > 0; i--) {
    await Future.delayed(const Duration(milliseconds: 10));
    yield i;
  }
}

Stream<int> evensOnly(Stream<int> source) async* {
  await for (final v in source) {
    if (v.isEven) yield v;
  }
}

Iterable<int> squares(int n) sync* {
  for (var i = 1; i <= n; i++) {
    yield i * i;
  }
}

Future<void> main() async {
  print(squares(5).toList());
  await for (final v in evensOnly(countdown(8))) {
    print('even $v');
  }
  print(await countdown(3).fold<int>(0, (a, b) => a + b));
}
