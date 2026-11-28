Stream<int> count(int n) async* {
  for (var i = 1; i <= n; i++) {
    await Future.delayed(Duration(milliseconds: 5));
    yield i;
  }
}

Future<void> main() async {
  await for (final v in count(5).where((x) => x.isOdd).map((x) => x * 10)) {
    print(v);
  }
}
