// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
int fact(int n) => n <= 1 ? 1 : n * fact(n - 1);
int comb(int n, int k) => fact(n) ~/ (fact(k) * fact(n - k));

void main() {
  const n = 5;
  print([for (var k = 1; k <= n; k++) comb(n - 1, k - 1) * fact(n) ~/ fact(k)].join(' '));
}
