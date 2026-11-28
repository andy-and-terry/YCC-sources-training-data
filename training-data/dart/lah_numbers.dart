BigInt fact(int n) => List.generate(n, (i) => BigInt.from(i + 1)).fold(BigInt.one, (a, b) => a * b);
BigInt comb(int n, int k) => fact(n) ~/ (fact(k) * fact(n - k));
BigInt lah(int n, int k) => comb(n - 1, k - 1) * fact(n) ~/ fact(k);

void main() {
  for (var n = 1; n <= 5; n++) {
    print([for (var k = 1; k <= n; k++) lah(n, k)].join(' '));
  }
}
