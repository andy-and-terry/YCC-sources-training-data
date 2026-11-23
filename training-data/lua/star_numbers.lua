-- 6n(n-1)+1
local function term(n)
  return ((6 * n) * (n - 1)) + 1
end

for n = 1, 15 do
  print(string.format("%2d -> %d", n, term(n)))
end
