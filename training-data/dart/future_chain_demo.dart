Future<int> parse(String s) async => int.parse(s);

Future<void> main() async {
  final result = await parse('20')
      .then((n) => n * 2)
      .then((n) => n + 2)
      .whenComplete(() => print('finished chain'));
  print(result);

  final recovered = await parse('x').catchError((_) => -1);
  print(recovered);

  print(await Future.value(5));
  print(await Future.delayed(const Duration(milliseconds: 10), () => 'late'));
}
