-- Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
local function is_bouncy(n)
  local s = tostring(n)
  local inc, dec = true, true
  for i = 2, #s do
    local a, b = s:byte(i - 1), s:byte(i)
    if a > b then inc = false end
    if a < b then dec = false end
  end
  return not inc and not dec
end

local count = 0
for n = 1, 999 do
  if is_bouncy(n) then count = count + 1 end
end
print(count)
