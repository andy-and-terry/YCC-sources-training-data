// Tetrahedral numbers: n(n+1)(n+2)/6.
void main() {
  print([for (var n = 1; n <= 10; n++) n * (n + 1) * (n + 2) ~/ 6].join(' '));
}
