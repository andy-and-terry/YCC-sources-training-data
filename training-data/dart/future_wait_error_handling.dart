Future<int> ok() async => 1;
Future<int> bad() async => throw StateError('bad');

Future<void> main() async {
  final r = await Future.wait([ok(), ok()]);
  print(r);
  try {
    await Future.wait([ok(), bad()]);
  } on StateError catch (e) {
    print('caught: ${e.message}');
  }
}
