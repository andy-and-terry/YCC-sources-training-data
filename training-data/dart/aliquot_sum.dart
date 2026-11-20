// Aliquot sum with a switch expression (Dart 3).
void main() {
  for (final n in [6, 12, 15, 28]) {
    final a = [for (var d = 1; d < n; d++) if (n % d == 0) d].fold(0, (s, d) => s + d);
    final kind = switch (a.compareTo(n)) { 0 => 'perfect', > 0 => 'abundant', _ => 'deficient' };
    print('$n $a $kind');
  }
}
