// n(n+1)/2+1
int term(int n) => ((n * (n + 1)) ~/ 2) + 1;

void main() {
  for (var n = 1; n <= 15; n++) {
    print('$n -> ${term(n)}');
  }
}
