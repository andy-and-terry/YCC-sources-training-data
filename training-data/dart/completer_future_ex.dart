import 'dart:async';

Future<String> fetchLater() {
  final c = Completer<String>();
  Timer(Duration(milliseconds: 5), () => c.complete('done'));
  return c.future;
}

Future<void> main() async {
  print(await fetchLater());
  print(await Future.wait([Future.value(1), Future.value(2)]));
}
