int primeFactorCount(int n) {
  var count = 0;
  for (var p = 2; p * p <= n; p++) {
    while (n % p == 0) {
      n ~/= p;
      count++;
    }
  }
  return n > 1 ? count + 1 : count;
}

void main() {
  print([for (var n = 2; n < 30; n++) if (primeFactorCount(n) == 2) n]);
}
