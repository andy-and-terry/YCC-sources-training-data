-- Tetrahedral numbers n(n+1)(n+2)/6
local function term(n) return ((n * (n + 1)) * (n + 2)) // 6 end

local out = {}
for n = 0, 9 do out[#out + 1] = term(n) end
print(table.concat(out, " "))
