// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
void main() {
  final n = [1, 1, 1];
  for (var i = 3; i < 15; i++) {
    n.add(n[i - 1] + n[i - 3]);
  }
  print(n.join(' '));
}
