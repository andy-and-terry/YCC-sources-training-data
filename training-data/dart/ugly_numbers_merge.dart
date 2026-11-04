import 'dart:math';

int ugly(int n) {
  final seq = <int>[1];
  var i2 = 0, i3 = 0, i5 = 0;
  while (seq.length < n) {
    final next = min(seq[i2] * 2, min(seq[i3] * 3, seq[i5] * 5));
    seq.add(next);
    if (next == seq[i2] * 2) i2++;
    if (next == seq[i3] * 3) i3++;
    if (next == seq[i5] * 5) i5++;
  }
  return seq[n - 1];
}

void main() => print([for (var i = 1; i <= 12; i++) ugly(i)]);
