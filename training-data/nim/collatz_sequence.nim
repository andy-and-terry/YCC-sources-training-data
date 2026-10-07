iterator collatz(start: int): int =
  var n = start
  yield n
  while n != 1:
    n = if n mod 2 == 0: n div 2 else: 3 * n + 1
    yield n

var steps = 0
for v in collatz(27):
  inc steps
echo "27 takes ", steps - 1, " steps"

var best, bestLen = 0
for s in 1 .. 1000:
  var len = 0
  for _ in collatz(s): inc len
  if len > bestLen: best = s; bestLen = len
echo best, " ", bestLen
