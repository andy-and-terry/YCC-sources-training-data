-- Centered square numbers: n^2 + (n+1)^2.
local out = {}
for n = 0, 9 do out[#out + 1] = n * n + (n + 1) * (n + 1) end
print(table.concat(out, " "))
