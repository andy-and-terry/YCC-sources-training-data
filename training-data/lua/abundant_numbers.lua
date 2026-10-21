local function divisor_sum(n)
  local s = 0
  for d = 1, n - 1 do
    if n % d == 0 then s = s + d end
  end
  return s
end

local out = {}
for n = 1, 59 do
  if divisor_sum(n) > n then out[#out + 1] = n end
end
print(table.concat(out, " "))
