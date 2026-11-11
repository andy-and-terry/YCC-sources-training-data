# Emirps: primes whose digit reversal is a different prime.
import std/[algorithm, strutils]

proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

proc rev(n: int): int =
  parseInt(($n).reversed.join)

var emirps: seq[int]
for n in 2 ..< 100:
  let r = rev(n)
  if r != n and isPrime(n) and isPrime(r):
    emirps.add n
echo emirps
