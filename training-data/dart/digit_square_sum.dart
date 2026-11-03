int digitSquareSum(int n) =>
    n.abs().toString().split('').map(int.parse).fold(0, (a, d) => a + d * d);

void main() {
  print(digitSquareSum(123));
  print(digitSquareSum(-99));
}
