// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
bool isPractical(int n) {
  var reach = <int>{0};
  for (var d = 1; d <= n; d++) {
    if (n % d == 0) reach = {...reach, ...reach.map((r) => r + d)};
  }
  return [for (var m = 1; m <= n; m++) m].every(reach.contains);
}

void main() {
  print([for (var n = 1; n <= 40; n++) if (isPractical(n)) n].join(' '));
}
