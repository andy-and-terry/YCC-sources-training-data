Stream<int> countTo(int n) async* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

Future<void> main() async {
  await for (final v in countTo(5).where((x) => x.isOdd).map((x) => x * 10)) {
    print(v);
  }
}
