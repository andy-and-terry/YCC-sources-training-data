proc classify(n: int): string =
  case n
  of low(int) .. -1: "negative"
  of 0: "zero"
  of 1 .. 9: "small"
  of 10, 20, 30: "round"
  else: "large"

for n in [-5, 0, 7, 20, 99]:
  echo n, " -> ", classify(n)
