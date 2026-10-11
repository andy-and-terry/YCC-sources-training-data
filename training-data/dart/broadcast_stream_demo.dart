import 'dart:async';

Future<void> main() async {
  final ctrl = StreamController<String>.broadcast();
  ctrl.stream.listen((s) => print('A: $s'));
  ctrl.stream.listen((s) => print('B: ${s.toUpperCase()}'));

  ctrl.add('one');
  ctrl.add('two');
  await ctrl.close();
  print('closed: ${ctrl.isClosed}');
}
