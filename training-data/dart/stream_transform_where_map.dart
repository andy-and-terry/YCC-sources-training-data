Stream<int> count(int n) async* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

Future<void> main() async {
  await for (final v in count(6).where((x) => x.isEven).map((x) => x * 10)) {
    print(v);
  }
}
