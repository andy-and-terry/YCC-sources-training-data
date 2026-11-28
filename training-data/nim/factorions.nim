const fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

for n in 1 ..< 50000:
  var s = 0
  var m = n
  while m > 0:
    s += fact[m mod 10]
    m = m div 10
  if s == n: stdout.write n, " "
echo "" # 1 2 145 40585
