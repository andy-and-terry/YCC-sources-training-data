// Circular primes below 100; expect 13.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

bool circular(int n) {
  final s = n.toString();
  for (var i = 0; i < s.length; i++) {
    if (!isPrime(int.parse(s.substring(i) + s.substring(0, i)))) return false;
  }
  return true;
}

void main() {
  print([for (var n = 2; n < 100; n++) if (circular(n)) n].length);
}
