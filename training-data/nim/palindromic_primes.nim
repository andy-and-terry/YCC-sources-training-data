import std/algorithm

proc isPrime(n: int): bool =
  if n < 2: return false
  var i = 2
  while i * i <= n:
    if n mod i == 0: return false
    inc i
  true

proc isPalindrome(n: int): bool =
  let s = $n
  s == s.reversed

for n in 2 ..< 200:
  if isPalindrome(n) and isPrime(n):
    stdout.write n, " "
echo "" # 2 3 5 7 11 101 131 151 181 191
