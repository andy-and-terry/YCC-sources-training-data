import 'dart:async';

Future<int> fetchValue(int id, int delayMs) {
  final completer = Completer<int>();
  Timer(Duration(milliseconds: delayMs), () {
    completer.complete(id * 10);
  });
  return completer.future;
}

Future<void> main() async {
  final results = await Future.wait([
    fetchValue(1, 30),
    fetchValue(2, 10),
    fetchValue(3, 20),
  ]);
  print(results);

  final total = results.fold<int>(0, (acc, v) => acc + v);
  print('total: $total');
}
