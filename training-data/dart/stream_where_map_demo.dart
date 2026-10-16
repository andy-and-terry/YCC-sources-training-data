Stream<int> numbers() => Stream.fromIterable(List.generate(10, (i) => i));

Future<void> main() async {
  final out = await numbers().where((n) => n.isOdd).map((n) => n * n).toList();
  print(out);
  print(await numbers().take(3).toList());
  print(await numbers().skip(8).toList());
  print(await numbers().first);
  print(await numbers().length);
  await for (final n in numbers().take(2)) {
    print('got $n');
  }
}
