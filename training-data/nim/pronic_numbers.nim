import std/math

proc isPronic(x: int): bool =
  let n = int(sqrt(float(x)))
  n * (n + 1) == x

for n in 0 ..< 10:
  stdout.write n * (n + 1), " "
echo "" # 0 2 6 12 20 30 42 56 72 90
echo isPronic(56), " ", isPronic(57) # true false
