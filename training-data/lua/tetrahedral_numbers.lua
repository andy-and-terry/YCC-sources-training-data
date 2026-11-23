-- n(n+1)(n+2)/6
local function term(n)
  return ((n * (n + 1)) * (n + 2)) // 6
end

for n = 1, 15 do
  print(string.format("%2d -> %d", n, term(n)))
end
