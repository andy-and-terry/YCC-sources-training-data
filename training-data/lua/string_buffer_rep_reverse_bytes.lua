local s = "Lua"
print(s:rep(3, "-"), s:reverse(), s:byte(1, -1))
print(string.char(72, 105), #s, s:upper():lower())
local t = {}
for i = 1, 5 do t[#t + 1] = i * i end
print(table.concat(t, ","))
