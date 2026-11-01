// Pernicious numbers: the popcount is prime.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

int popcount(int n) => n.toRadixString(2).replaceAll('0', '').length;

void main() {
  print([for (var n = 1; n <= 20; n++) if (isPrime(popcount(n))) n].join(' '));
}
