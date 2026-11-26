# Primorials up to 1e6, including 1; expect 8.
proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

var values = @[1]
var acc = 1
var p = 2
while true:
  if isPrime(p):
    acc *= p
    if acc > 1_000_000: break
    values.add acc
  inc p
echo values.len, " ", values
