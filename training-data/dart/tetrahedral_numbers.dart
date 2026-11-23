// n(n+1)(n+2)/6
int term(int n) => ((n * (n + 1)) * (n + 2)) ~/ 6;

void main() {
  for (var n = 1; n <= 15; n++) {
    print('$n -> ${term(n)}');
  }
}
