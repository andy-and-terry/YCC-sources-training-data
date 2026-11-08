void hanoi(int n, String a, String b, String c, List<String> out) {
  if (n == 0) return;
  hanoi(n - 1, a, c, b, out);
  out.add('$a->$c');
  hanoi(n - 1, b, a, c, out);
}

void main() {
  final moves = <String>[];
  hanoi(3, 'A', 'B', 'C', moves);
  print('${moves.length}: ${moves.join(' ')}');
}
