proc hanoi(n: int, a, b, c: string, moves: var seq[string]) =
  if n == 0: return
  hanoi(n - 1, a, c, b, moves)
  moves.add a & "->" & c
  hanoi(n - 1, b, a, c, moves)

var moves: seq[string]
hanoi(3, "A", "B", "C", moves)
echo moves.len, ": ", moves
