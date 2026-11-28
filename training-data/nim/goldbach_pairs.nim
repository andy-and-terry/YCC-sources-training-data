proc isPrime(n: int): bool =
  if n < 2: return false
  var d = 2
  while d * d <= n:
    if n mod d == 0: return false
    inc d
  true

let n = 28
for p in 2 .. n div 2:
  if isPrime(p) and isPrime(n - p):
    echo p, " + ", n - p
