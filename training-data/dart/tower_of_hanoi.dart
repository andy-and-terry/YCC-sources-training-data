// Tower of Hanoi using a recursive generator (sync*).

typedef Move = (String from, String to);

Iterable<Move> hanoi(int n, String from, String to, String via) sync* {
  if (n == 0) return;
  yield* hanoi(n - 1, from, via, to);
  yield (from, to);
  yield* hanoi(n - 1, via, to, from);
}

void main() {
  final moves = hanoi(3, 'A', 'C', 'B').toList();
  for (var i = 0; i < moves.length; i++) {
    final (from, to) = moves[i];
    print('Move ${i + 1}: $from -> $to');
  }
  print('Total: ${moves.length} moves');
}
