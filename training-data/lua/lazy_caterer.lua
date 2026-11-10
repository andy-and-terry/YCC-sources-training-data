local function pieces(cuts) return (cuts * cuts + cuts + 2) // 2 end

local out = {}
for n = 0, 9 do out[#out + 1] = pieces(n) end
print(table.concat(out, " ")) -- 1 2 4 7 11 16 22 29 37 46
