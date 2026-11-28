local function is_armstrong(n)
  local s = tostring(n)
  local sum = 0
  for d in s:gmatch("%d") do sum = sum + d ^ #s end
  return sum == n
end

local out = {}
for n = 1, 999 do
  if is_armstrong(n) then out[#out + 1] = n end
end
print(table.concat(out, " ")) -- 1..9 153 370 371 407
