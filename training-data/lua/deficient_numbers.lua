-- Deficient numbers below 100; expect 76.
local function proper_sum(n)
  local t = 0
  for d = 1, n - 1 do if n % d == 0 then t = t + d end end
  return t
end
local c = 0
for n = 1, 99 do if proper_sum(n) < n then c = c + 1 end end
print(c)
