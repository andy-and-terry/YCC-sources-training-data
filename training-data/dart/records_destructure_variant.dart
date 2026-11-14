(int, String) pair() => (1, 'one');

({String name, int age}) person() => (name: 'Ann', age: 30);

void main() {
  var (n, s) = pair();
  print('$n $s');
  final p = person();
  print('${p.name} ${p.age}');
}
