-- Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
local p = {[0] = 1, 1, 1}
for i = 3, 14 do
  p[i] = p[i - 2] + p[i - 3]
end
print(table.concat(p, " ", 0, 14))
