// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
bool isPrime(int n) {
  for (var p = 2; p * p <= n; p++) {
    if (n % p == 0) return false;
  }
  return n > 1;
}

bool isCarmichael(int n) {
  if (isPrime(n)) return false;
  for (var a = 2; a < n; a++) {
    if (a.gcd(n) == 1 && BigInt.from(a).modPow(BigInt.from(n - 1), BigInt.from(n)) != BigInt.one) {
      return false;
    }
  }
  return true;
}

void main() {
  print([for (var n = 3; n < 3000; n += 2) if (isCarmichael(n)) n].join(' '));
}
