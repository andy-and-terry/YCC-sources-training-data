Stream<int> count(int n) async* {
  for (var i = 1; i <= n; i++) {
    await Future.delayed(Duration(milliseconds: 1));
    yield i;
  }
}

Future<void> main() async {
  await for (final v in count(5).where((x) => x.isOdd).map((x) => x * x)) {
    print(v);
  }
}
