// Lazy caterer sequence: max pieces from n cuts
int term(int n) => ((n * (n + 1)) ~/ 2) + 1;

void main() {
  print(List.generate(10, term).join(' '));
}
