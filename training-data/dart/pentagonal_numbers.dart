// Pentagonal numbers: n(3n-1)/2.
void main() {
  print([for (var n = 1; n <= 10; n++) n * (3 * n - 1) ~/ 2].join(' '));
}
