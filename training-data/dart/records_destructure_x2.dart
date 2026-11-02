(int, String) pair() => (1, 'one');

void main() {
  final (n, s) = pair();
  print('$n $s');
  final named = (a: 1, b: 2);
  print(named.a + named.b);
}
