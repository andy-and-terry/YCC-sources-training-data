# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
proc isMunchausen(n: int): bool =
  var sum = 0
  var m = n
  while m > 0:
    let d = m mod 10
    if d > 0:
      var p = 1
      for _ in 1 .. d: p *= d
      sum += p
    m = m div 10
  sum == n

for n in 1 ..< 5000:
  if isMunchausen(n): stdout.write n, " "
echo ""
