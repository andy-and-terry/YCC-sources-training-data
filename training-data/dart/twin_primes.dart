// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

void main() {
  final out = [for (var p = 2; p < 100; p++) if (isPrime(p) && isPrime(p + 2)) p];
  print(out.join(' '));
}
