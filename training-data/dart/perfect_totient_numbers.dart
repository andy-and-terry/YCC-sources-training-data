// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
int phi(int n) {
  var c = 0;
  for (var k = 1; k <= n; k++) {
    if (k.gcd(n) == 1) c++;
  }
  return c;
}

bool isPerfectTotient(int n) {
  var total = 0;
  for (var m = n; m > 1;) {
    m = phi(m);
    total += m;
  }
  return total == n;
}

void main() {
  print([for (var n = 2; n < 200; n++) if (isPerfectTotient(n)) n].join(' '));
}
