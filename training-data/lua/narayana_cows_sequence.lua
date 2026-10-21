-- Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
local n = {[0] = 1, [1] = 1, [2] = 1}
for i = 3, 14 do
  n[i] = n[i - 1] + n[i - 3]
end
local out = {}
for i = 0, 14 do out[#out + 1] = tostring(n[i]) end
print(table.concat(out, " "))
