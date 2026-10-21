-- Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
local p = {[0] = 3, [1] = 0, [2] = 2}
for n = 3, 14 do
  p[n] = p[n - 2] + p[n - 3]
end
local out = {}
for n = 0, 14 do out[#out + 1] = tostring(p[n]) end
print(table.concat(out, " "))
