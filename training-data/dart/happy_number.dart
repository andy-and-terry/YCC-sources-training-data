int step(int n) {
  var s = 0;
  for (; n > 0; n ~/= 10) {
    s += (n % 10) * (n % 10);
  }
  return s;
}

bool isHappy(int n) {
  final seen = <int>{};
  while (n != 1 && seen.add(n)) {
    n = step(n);
  }
  return n == 1;
}

void main() => print([for (var i = 1; i <= 50; i++) if (isHappy(i)) i]);
