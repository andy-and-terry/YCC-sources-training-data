proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

iterator cuban(): int =
  var y = 1
  while true:
    let p = 3 * y * y + 3 * y + 1
    if isPrime(p): yield p
    inc y

var count = 0
for p in cuban():
  stdout.write p, " "
  inc count
  if count == 8: break
echo ""
