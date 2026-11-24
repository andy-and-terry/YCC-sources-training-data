-- Pentagonal numbers: n(3n-1)/2.
local out = {}
for n = 1, 10 do out[#out + 1] = n * (3 * n - 1) // 2 end
print(table.concat(out, " "))
