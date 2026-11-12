import 'dart:async';
Future<int> legacy() {
  final c = Completer<int>();
  Timer(Duration(milliseconds: 2), () => c.complete(42));
  return c.future;
}
Future<void> main() async {
  print(await legacy());
  print(await Future.wait([legacy(), Future.value(1)]));
}
