local function tau(n)
  local c = 0
  for d = 1, n do if n % d == 0 then c = c + 1 end end
  return c
end

local out = {}
for n = 1, 59 do
  if n % tau(n) == 0 then out[#out + 1] = n end
end
print(table.concat(out, " ")) -- 1 2 8 9 12 18 24 36 40 56
