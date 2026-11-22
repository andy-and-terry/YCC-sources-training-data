-- Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
local out = {}
for n = 0, 9 do out[#out + 1] = n * (n + 1) // 2 + 1 end
print(table.concat(out, " "))
