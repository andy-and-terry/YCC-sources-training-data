# Squarefree numbers up to 100; expect 61.
proc squarefree(n: int): bool =
  var d = 2
  while d * d <= n:
    if n mod (d * d) == 0: return false
    inc d
  true

var c = 0
for n in 1 .. 100:
  if squarefree(n): inc c
echo c
