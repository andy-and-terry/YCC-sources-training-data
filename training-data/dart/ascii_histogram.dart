import 'dart:math';

String histogram(String s, {int width = 30}) {
  final counts = <String, int>{};
  for (final c in s.split('')) {
    counts.update(c, (n) => n + 1, ifAbsent: () => 1);
  }
  final peak = counts.values.reduce(max);
  final keys = counts.keys.toList()..sort();
  return keys.map((k) {
    final n = counts[k]!;
    return '$k | ${'#' * max(1, n * width ~/ peak)} $n';
  }).join('\n');
}

void main() => print(histogram('theraininspainfallsmainlyontheplain'));
