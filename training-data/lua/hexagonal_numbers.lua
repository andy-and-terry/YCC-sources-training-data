-- Hexagonal numbers: n(2n-1).
local out = {}
for n = 1, 10 do out[#out + 1] = n * (2 * n - 1) end
print(table.concat(out, " "))
