-- Lazy caterer sequence: max pieces from n cuts
local function term(n) return ((n * (n + 1)) // 2) + 1 end

local out = {}
for n = 0, 9 do out[#out + 1] = term(n) end
print(table.concat(out, " "))
