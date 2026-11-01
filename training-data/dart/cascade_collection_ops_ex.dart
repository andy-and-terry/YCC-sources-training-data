void main() {
  final list = [3, 1, 2];
  final withExtra = [0, ...list, if (list.length > 2) 99];
  print(withExtra);
  final squares = {for (var i in list) i: i * i};
  print(squares);
  final sb = StringBuffer()..write('a')..write('b')..writeln('c');
  print(sb);
}
