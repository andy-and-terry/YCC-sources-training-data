// Amicable pairs: d(a) == b and d(b) == a with a != b.
int d(int n) {
  var s = 0;
  for (var i = 1; i < n; i++) {
    if (n % i == 0) s += i;
  }
  return s;
}

void main() {
  for (var a = 2; a < 1500; a++) {
    final b = d(a);
    if (b > a && d(b) == a) print('$a $b');
  }
}
