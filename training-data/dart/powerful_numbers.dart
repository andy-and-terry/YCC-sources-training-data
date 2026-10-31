bool isPowerful(int n) {
  for (var p = 2; p * p <= n; p++) {
    if (n % p == 0) {
      if (n % (p * p) != 0) return false;
      while (n % p == 0) {
        n ~/= p;
      }
    }
  }
  return n == 1;
}

void main() {
  print([for (var n = 1; n <= 100; n++) if (isPowerful(n)) n].join(' '));
}
