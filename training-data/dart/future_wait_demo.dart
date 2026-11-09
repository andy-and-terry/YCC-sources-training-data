Future<int> delayed(int v) => Future.delayed(Duration(milliseconds: 10), () => v);

Future<void> main() async {
  final r = await Future.wait([delayed(1), delayed(2), delayed(3)]);
  print(r);
}
