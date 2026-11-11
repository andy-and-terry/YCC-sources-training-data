// Narayana's cows N(n)=N(n-1)+N(n-3)
void main() {
  final v = <int>[1, 1, 1];
  for (var i = 3; i < 10; i++) {
    v.add(v[i - 1] + v[i - 3]);
  }
  print(v.join(' '));
}
