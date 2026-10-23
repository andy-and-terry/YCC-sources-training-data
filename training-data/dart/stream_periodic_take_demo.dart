import 'dart:async';

Future<void> main() async {
  // Stream.periodic emits on a timer; take limits it.
  final ticks = Stream<int>.periodic(const Duration(milliseconds: 20), (i) => i)
      .take(5);

  await for (final t in ticks) {
    print('tick $t');
  }

  final doubled = await Stream.periodic(
    const Duration(milliseconds: 10),
    (i) => i * 2,
  ).skip(1).take(3).toList();
  print(doubled);

  final total = await Stream.fromIterable([1, 2, 3, 4]).fold<int>(0, (a, b) => a + b);
  print(total);
}
