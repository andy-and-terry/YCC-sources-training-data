# Read the binary digits of i as base-4 digits.
proc moserDeBruijn(i: int): int =
  var x = i
  var power = 1
  while x > 0:
    if (x and 1) == 1: result += power
    power *= 4
    x = x shr 1

for i in 0 .. 9: stdout.write moserDeBruijn(i), " "
echo "" # 0 1 4 5 16 17 20 21 64 65
