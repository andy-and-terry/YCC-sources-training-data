local function is_happy(n)
  local seen = {}
  while n ~= 1 and not seen[n] do
    seen[n] = true
    local s = 0
    for d in tostring(n):gmatch("%d") do s = s + d * d end
    n = s
  end
  return n == 1
end

local found, n = {}, 1
while #found < 8 do
  if is_happy(n) then found[#found + 1] = n end
  n = n + 1
end
print(table.concat(found, " ")) -- 1 7 10 13 19 23 28 31
