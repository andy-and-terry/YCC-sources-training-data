-- Perrin sequence P(n)=P(n-2)+P(n-3)
local v = { 3, 0, 2 }
for i = 4, 10 do v[i] = v[i - 2] + v[i - 3] end
print(table.concat(v, " "))
