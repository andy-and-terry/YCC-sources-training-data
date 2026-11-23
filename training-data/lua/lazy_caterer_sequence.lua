-- n(n+1)/2+1
local function term(n)
  return ((n * (n + 1)) // 2) + 1
end

for n = 1, 15 do
  print(string.format("%2d -> %d", n, term(n)))
end
