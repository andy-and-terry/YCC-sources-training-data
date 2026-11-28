bool isAutomorphic(int n) => (n * n).toString().endsWith(n.toString());

void main() {
  print([for (var n = 0; n < 1000; n++) if (isAutomorphic(n)) n]);
  // [0, 1, 5, 6, 25, 76, 376, 625]
}
