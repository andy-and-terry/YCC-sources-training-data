-- n^2(n+1)/2
local function term(n)
  return ((n * n) * (n + 1)) // 2
end

for n = 1, 15 do
  print(string.format("%2d -> %d", n, term(n)))
end
