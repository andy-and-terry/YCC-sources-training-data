local function cube_from_odds(n)
  local start, sum = n * n - n + 1, 0
  for i = 0, n - 1 do sum = sum + start + 2 * i end
  return sum
end

for n = 1, 5 do
  print(n, cube_from_odds(n), cube_from_odds(n) == n ^ 3)
end
