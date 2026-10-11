proc fact(n: int): int =
  result = 1
  for i in 2 .. n: result *= i

proc sign(x: int): int =
  if x > 0: 1
  elif x < 0: -1
  else: 0

proc noisy(x: int): string =
  if x == 0: return "zero"
  result = "n=" & $x

echo fact(6), " ", sign(-9), " ", noisy(0), " ", noisy(3)
