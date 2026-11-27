proc lah(n, k: int): int =
  var c = 1
  var f = 1
  for i in 0 ..< k - 1: c = c * (n - 1 - i) div (i + 1)
  for i in k + 1 .. n: f *= i
  c * f

for n in 1 .. 5:
  for k in 1 .. n:
    stdout.write lah(n, k), " "
  echo ""
