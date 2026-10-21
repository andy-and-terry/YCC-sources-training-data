local function is_pronic(n)
  local k = math.floor(math.sqrt(n))
  return k * (k + 1) == n
end

local out = {}
for n = 0, 99 do
  if is_pronic(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
