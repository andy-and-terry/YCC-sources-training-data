Stream<int> countdown(int n) async* {
  for (var i = n; i > 0; i--) {
    await Future.delayed(Duration(milliseconds: 5));
    yield i;
  }
}

Future<void> main() async {
  await for (final v in countdown(3)) {
    print(v);
  }
}
