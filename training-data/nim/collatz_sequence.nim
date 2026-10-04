import std/math
proc collatz(n: int): seq[int] =
  var x = n
  result = @[x]
  while x != 1:
    x = if x mod 2 == 0: x div 2 else: 3 * x + 1
    result.add(x)

let s = collatz(27)
echo "length: ", s.len
echo "max: ", max(s)
echo collatz(6)
