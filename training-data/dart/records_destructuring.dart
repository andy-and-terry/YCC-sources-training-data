(int, String) pair() => (1, 'a');
({int x, int y}) point() => (x: 3, y: 4);
void main() {
  final (n, s) = pair();
  final p = point();
  print('$n $s ${p.x + p.y}');
}
