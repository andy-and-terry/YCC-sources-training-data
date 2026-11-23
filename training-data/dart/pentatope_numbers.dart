// n(n+1)(n+2)(n+3)/24
int term(int n) => (((n * (n + 1)) * (n + 2)) * (n + 3)) ~/ 24;

void main() {
  for (var n = 1; n <= 15; n++) {
    print('$n -> ${term(n)}');
  }
}
