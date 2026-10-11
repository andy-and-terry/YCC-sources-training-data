import 'dart:async';

Future<String> fetchLater() {
  final c = Completer<String>();
  Timer(const Duration(milliseconds: 20), () => c.complete('done'));
  return c.future;
}

Future<void> main() async {
  print('waiting');
  print(await fetchLater());

  final failing = Completer<int>()..completeError(Exception('nope'));
  try {
    await failing.future;
  } catch (e) {
    print('error: $e');
  }
}
