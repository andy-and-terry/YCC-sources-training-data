// Highest value reached by the Collatz (hailstone) sequence from n.
import 'dart:math';

int peak(int n) {
  var best = n;
  while (n != 1) {
    n = n.isEven ? n ~/ 2 : 3 * n + 1;
    best = max(best, n);
  }
  return best;
}

void main() => print(peak(27));
