// Hexagonal numbers: n(2n-1).
void main() {
  print([for (var n = 1; n <= 10; n++) n * (2 * n - 1)].join(' '));
}
