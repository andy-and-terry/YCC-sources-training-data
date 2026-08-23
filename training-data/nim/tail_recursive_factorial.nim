proc factorial(n: int): int =
  result = 1
  for i in 1 .. n:
    result *= i

echo factorial(10)
