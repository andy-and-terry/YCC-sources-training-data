# Highest value reached by the Collatz (hailstone) sequence from n.
proc peak(start: int): int =
  var n = start
  result = n
  while n != 1:
    n = if n mod 2 == 0: n div 2 else: 3 * n + 1
    result = max(result, n)

echo peak(27)
