// Centered square numbers 2n(n+1)+1
int term(int n) => ((2 * n) * (n + 1)) + 1;

void main() {
  print(List.generate(10, term).join(' '));
}
