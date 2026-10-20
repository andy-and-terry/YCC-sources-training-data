Future<int> square(int n) async {
  await Future.delayed(Duration(milliseconds: 10));
  return n * n;
}

Stream<int> countdown(int from) async* {
  for (var i = from; i > 0; i--) {
    await Future.delayed(Duration(milliseconds: 5));
    yield i;
  }
}

Future<void> main() async {
  print(await Future.wait([square(2), square(3), square(4)]));
  await for (final v in countdown(3)) {
    print(v);
  }
  print(await square(5).then((v) => v + 1));
  try {
    await Future.error(StateError('boom'));
  } on StateError catch (e) {
    print('caught ${e.message}');
  } finally {
    print('done');
  }
  print(await countdown(5).where((x) => x.isOdd).toList());
  print(await Future.any([Future.delayed(Duration(milliseconds: 50), () => 'slow'), Future.value('fast')]));
  final s = Stream.fromIterable([1, 2, 3]).map((x) => x * 10);
  print(await s.reduce((a, b) => a + b));
}
