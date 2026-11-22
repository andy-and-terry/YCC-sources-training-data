-- Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
local out = {}
for n = 0, 9 do out[#out + 1] = (n * n * n + 5 * n + 6) // 6 end
print(table.concat(out, " "))
