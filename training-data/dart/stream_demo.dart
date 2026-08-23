Stream<int> countUp(int max) async* {
  for (var i = 1; i <= max; i++) {
    yield i;
  }
}

Future<void> main() async {
  final values = await countUp(5).toList();
  print(values);

  final sum = await countUp(5).fold<int>(0, (acc, x) => acc + x);
  print(sum);
}
