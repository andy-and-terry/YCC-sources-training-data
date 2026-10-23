-- P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
local a, b = 0, 1
for i = 0, 14 do
  print(string.format("P(%d) = %d", i, a))
  a, b = b, 2 * b + a
end
