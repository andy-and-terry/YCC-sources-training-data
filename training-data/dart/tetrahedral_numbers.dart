// Tetrahedral numbers n(n+1)(n+2)/6
int term(int n) => ((n * (n + 1)) * (n + 2)) ~/ 6;

void main() {
  print(List.generate(10, term).join(' '));
}
