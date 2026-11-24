// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
int mobius(int n) {
  var result = 1;
  for (var p = 2; p * p <= n; p++) {
    if (n % p == 0) {
      n ~/= p;
      if (n % p == 0) return 0;
      result = -result;
    }
  }
  return n > 1 ? -result : result;
}

void main() {
  print([for (var n = 1; n <= 30; n++) mobius(n)].join(' '));
}
