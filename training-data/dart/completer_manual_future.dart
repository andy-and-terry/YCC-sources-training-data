import 'dart:async';

Future<void> main() async {
  final c = Completer<String>();
  Timer(Duration(milliseconds: 10), () => c.complete('ready'));
  print(await c.future);
}
