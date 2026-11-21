// Amicable pairs below 1500 via sums of proper divisors.
int s(int n) {
  var t = 0;
  for (var d = 1; d < n; d++) {
    if (n % d == 0) t += d;
  }
  return t;
}

void main() {
  for (var a = 2; a < 1500; a++) {
    final b = s(a);
    if (b > a && s(b) == a) print('$a $b');
  }
}
