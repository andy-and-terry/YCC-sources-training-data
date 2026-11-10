local function cake(n) return (n ^ 3 + 5 * n + 6) // 6 end

local out = {}
for n = 0, 9 do out[#out + 1] = math.tointeger(cake(n)) end
print(table.concat(out, " ")) -- 1 2 4 8 15 26 42 64 93 130
