(int, String) pair() => (1, 'one');

void main() {
  var (n, s) = pair();
  print('$n $s');
  var p = (x: 1, y: 2);
  print(p.x + p.y);
}
