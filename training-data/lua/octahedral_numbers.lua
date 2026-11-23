-- n(2n^2+1)/3
local function term(n)
  return (n * (((2 * n) * n) + 1)) // 3
end

for n = 1, 15 do
  print(string.format("%2d -> %d", n, term(n)))
end
