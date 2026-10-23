(int, String) pair() => (1, 'one');

({String name, int age}) person() => (name: 'Ada', age: 36);

void main() {
  final (n, word) = pair();
  print('$n $word');
  final p = person();
  print('${p.name} is ${p.age}');
  var (a, b) = (1, 2);
  (a, b) = (b, a);
  print('$a $b');
}
