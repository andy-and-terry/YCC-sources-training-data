import sequtils, strutils

proc digitSum(n: int): int =
  var m = n
  while m > 0:
    result += m mod 10
    m = m div 10

proc primeFactors(n: int): seq[int] =
  var m = n
  var p = 2
  while m > 1:
    if p * p > m:
      result.add(m)
      break
    while m mod p == 0:
      result.add(p)
      m = m div p
    inc p

proc isSmith(n: int): bool =
  let fs = primeFactors(n)
  var total = 0
  for f in fs:
    total += digitSum(f)
  result = fs.len > 1 and digitSum(n) == total

echo toSeq(2 .. 99).filterIt(isSmith(it)).mapIt($it).join(" ")
