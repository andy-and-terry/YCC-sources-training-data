// 3n(n-1)+1
int term(int n) => ((3 * n) * (n - 1)) + 1;

void main() {
  for (var n = 1; n <= 15; n++) {
    print('$n -> ${term(n)}');
  }
}
