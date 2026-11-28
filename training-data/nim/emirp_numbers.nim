import std/[strutils, algorithm]

proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

proc reversed(n: int): int = parseInt(($n).reversed)

for p in 2 ..< 200:
  let r = reversed(p)
  if r != p and isPrime(p) and isPrime(r):
    stdout.write p, " "
echo "" # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
