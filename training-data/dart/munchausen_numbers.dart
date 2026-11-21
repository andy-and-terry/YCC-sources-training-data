// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
int power(int b, int e) {
  var r = 1;
  for (var i = 0; i < e; i++) r *= b;
  return r;
}

bool isMunchausen(int n) {
  var sum = 0;
  for (final c in n.toString().split('')) {
    final d = int.parse(c);
    if (d > 0) sum += power(d, d);
  }
  return sum == n;
}

void main() {
  print([for (var n = 1; n < 5000; n++) if (isMunchausen(n)) n].join(' '));
}
