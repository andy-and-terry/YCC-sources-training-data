// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
List<int> padovan(int count) {
  final p = <int>[];
  for (var i = 0; i < count; i++) {
    p.add(i < 3 ? 1 : p[i - 2] + p[i - 3]);
  }
  return p;
}

void main() {
  print(padovan(15).join(' '));
}
