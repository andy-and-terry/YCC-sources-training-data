import std/math

proc isPrime(n: int): bool =
  if n < 2:
    return false
  for i in 2 .. int(sqrt(float(n))):
    if n mod i == 0:
      return false
  return true

var primes: seq[int] = @[]
for n in 2 .. 20:
  if isPrime(n):
    primes.add(n)
echo primes
