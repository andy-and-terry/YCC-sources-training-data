// Square pyramidal numbers n(n+1)(2n+1)/6
int term(int n) => ((n * (n + 1)) * ((2 * n) + 1)) ~/ 6;

void main() {
  print(List.generate(10, term).join(' '));
}
