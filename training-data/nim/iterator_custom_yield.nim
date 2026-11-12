iterator evens(n: int): int =
  for i in 0 ..< n:
    if i mod 2 == 0: yield i
for e in evens(10): stdout.write e, " "
echo ""
