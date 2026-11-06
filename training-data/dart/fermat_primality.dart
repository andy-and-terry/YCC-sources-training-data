// Fermat primality test; Carmichael number 561 fools it.
int powmod(int base, int exp, int mod) {
  var result = 1;
  base %= mod;
  while (exp > 0) {
    if (exp.isOdd) result = result * base % mod;
    base = base * base % mod;
    exp >>= 1;
  }
  return result;
}

bool probablyPrime(int n) => n > 2 && powmod(2, n - 1, n) == 1;

void main() {
  for (final n in [97, 91, 561]) {
    print('$n ${probablyPrime(n)}');
  }
}
