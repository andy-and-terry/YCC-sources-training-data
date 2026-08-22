Future<int> fetchValue(int value, Duration delay) async {
  await Future.delayed(delay);
  return value;
}

Future<void> main() async {
  final results = await Future.wait([
    fetchValue(1, Duration(milliseconds: 10)),
    fetchValue(2, Duration(milliseconds: 5)),
    fetchValue(3, Duration(milliseconds: 1)),
  ]);
  print(results);
}
