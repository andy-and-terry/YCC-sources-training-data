// Pronic numbers n(n+1)
int term(int n) => n * (n + 1);

void main() {
  print(List.generate(10, term).join(' '));
}
