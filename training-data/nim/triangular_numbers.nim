iterator triangular(count: int): int =
  var sum = 0
  for n in 1 .. count:
    sum += n
    yield sum

for t in triangular(10): stdout.write t, " "
echo ""
