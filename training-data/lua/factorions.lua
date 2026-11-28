local fact = { [0] = 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 }

local out = {}
for n = 1, 49999 do
  local s = 0
  for d in tostring(n):gmatch("%d") do s = s + fact[tonumber(d)] end
  if s == n then out[#out + 1] = n end
end
print(table.concat(out, " ")) -- 1 2 145 40585
