int gcd(int a, int b) {
  while (b != 0) {
    final t = b;
    b = a % b;
    a = t;
  }
  return a;
}

int lcm(int a, int b) => a ~/ gcd(a, b) * b;

void main() {
  print(lcm(4, 6));
  print(lcm(21, 6));
}
