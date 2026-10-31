proc cubeFromOdds(n: int): int =
  let start = n * n - n + 1
  for i in 0 ..< n:
    result += start + 2 * i

for n in 1 .. 5:
  echo n, " ", cubeFromOdds(n), " ", cubeFromOdds(n) == n * n * n
