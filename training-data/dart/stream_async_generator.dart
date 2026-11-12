Stream<int> ticks(int n) async* {
  for (var i = 0; i < n; i++) {
    await Future.delayed(Duration(milliseconds: 1));
    yield i;
  }
}
Future<void> main() async {
  await for (final t in ticks(3)) {
    print(t);
  }
  print(await ticks(5).where((x) => x.isOdd).toList());
}
