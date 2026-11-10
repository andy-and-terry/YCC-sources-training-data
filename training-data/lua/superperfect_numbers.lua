local function sigma(n)
  local s = 0
  for d = 1, n do if n % d == 0 then s = s + d end end
  return s
end

local out = {}
for n = 1, 99 do
  if sigma(sigma(n)) == 2 * n then out[#out + 1] = n end
end
print(table.concat(out, " ")) -- 2 4 16 64
