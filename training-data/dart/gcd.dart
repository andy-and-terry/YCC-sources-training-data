int gcd(int a, int b) {
  var x = a, y = b;
  while (y != 0) {
    final temp = y;
    y = x % y;
    x = temp;
  }
  return x;
}

void main() {
  print(gcd(48, 18));
  print(gcd(100, 75));
}
