const fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

bool isFactorion(int n) =>
    n == n.toString().split('').fold<int>(0, (s, d) => s + fact[int.parse(d)]);

void main() {
  print([for (var n = 1; n < 50000; n++) if (isFactorion(n)) n]);
}
