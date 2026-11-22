// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
void main() {
  print(List.generate(10, (n) => n * (n + 1) ~/ 2 + 1).join(' '));
}
