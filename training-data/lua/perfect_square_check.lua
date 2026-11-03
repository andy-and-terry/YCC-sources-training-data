local function is_perfect_square(n)
  if n < 0 then return false end
  local r = math.floor(math.sqrt(n) + 0.5)
  return r * r == n
end

local out = {}
for n = 0, 29 do
  if is_perfect_square(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
