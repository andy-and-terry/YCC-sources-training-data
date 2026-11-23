// n(2n^2+1)/3
int term(int n) => (n * (((2 * n) * n) + 1)) ~/ 3;

void main() {
  for (var n = 1; n <= 15; n++) {
    print('$n -> ${term(n)}');
  }
}
