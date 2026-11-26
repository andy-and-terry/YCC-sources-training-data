// Sexy primes below 100; expect 16 pairs.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

void main() {
  print([for (var p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 6)) p].length);
}
