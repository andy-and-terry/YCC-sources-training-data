import 'dart:isolate';

int heavy(int n) { var s = 0; for (var i = 1; i <= n; i++) { s += i; } return s; }

Future<void> main() async {
  print(await Isolate.run(() => heavy(100000)));
  final rp = ReceivePort();
  await Isolate.spawn((SendPort sp) {
    for (var i = 1; i <= 3; i++) { sp.send(i * i); }
    sp.send(null);
  }, rp.sendPort);
  final out = <int>[];
  await for (final m in rp) {
    if (m == null) { rp.close(); break; }
    out.add(m as int);
  }
  print(out);
  final results = await Future.wait([1, 2, 3].map((n) => Isolate.run(() => n * 100)));
  print(results);
}
