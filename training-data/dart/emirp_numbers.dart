// Emirps: primes whose digit reversal is a different prime.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

int reverse(int n) => int.parse(n.toString().split('').reversed.join());

void main() {
  final emirps = [
    for (var n = 2; n < 100; n++)
      if (reverse(n) != n && isPrime(n) && isPrime(reverse(n))) n
  ];
  print(emirps);
}
