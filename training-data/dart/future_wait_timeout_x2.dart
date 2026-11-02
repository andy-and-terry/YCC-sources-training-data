Future<int> slow() => Future.delayed(Duration(milliseconds: 50), () => 1);

Future<void> main() async {
  final rs = await Future.wait([slow(), slow()]);
  print(rs);
  try {
    await slow().timeout(Duration(milliseconds: 5));
  } on Exception catch (e) {
    print(e.runtimeType);
  }
}
