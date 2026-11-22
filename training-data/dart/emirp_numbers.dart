// Emirps: primes whose digit reversal is a different prime.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

void main() {
  final out = <int>[];
  for (var n = 2; n < 200; n++) {
    final r = int.parse(n.toString().split('').reversed.join());
    if (r != n && isPrime(n) && isPrime(r)) out.add(n);
  }
  print(out.join(' '));
}
