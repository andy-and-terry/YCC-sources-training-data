// Wilson's theorem primality test.
bool wilson(int n) {
  if (n < 2) return false;
  var f = 1;
  for (var i = 2; i < n; i++) {
    f = f * i % n;
  }
  return f == n - 1;
}

void main() => print([for (var n = 2; n < 20; n++) if (wilson(n)) n]);
