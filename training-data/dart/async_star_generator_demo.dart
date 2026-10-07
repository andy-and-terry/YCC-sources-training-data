Stream<int> countdown(int from) async* {
  for (var i = from; i > 0; i--) {
    await Future<void>.delayed(const Duration(milliseconds: 10));
    yield i;
  }
}

Stream<int> evensOnly(Stream<int> source) async* {
  await for (final n in source) {
    if (n.isEven) yield n;
  }
}

Future<void> main() async {
  await for (final n in countdown(3)) {
    print('tick $n');
  }
  print(await evensOnly(countdown(6)).toList());
  print(await countdown(4).fold<int>(0, (a, b) => a + b));
}
