// Perrin sequence P(n)=P(n-2)+P(n-3)
void main() {
  final v = <int>[3, 0, 2];
  for (var i = 3; i < 10; i++) {
    v.add(v[i - 2] + v[i - 3]);
  }
  print(v.join(' '));
}
