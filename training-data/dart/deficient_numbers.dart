// Deficient numbers below 100; expect 76.
int properSum(int n) {
  var t = 0;
  for (var d = 1; d < n; d++) {
    if (n % d == 0) t += d;
  }
  return t;
}

void main() {
  print([for (var n = 1; n < 100; n++) if (properSum(n) < n) n].length);
}
