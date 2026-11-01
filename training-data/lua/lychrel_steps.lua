-- Reverse-and-add until a palindrome; count the steps.
local function steps(n)
  for count = 0, 49 do
    local s = tostring(n)
    if count > 0 and s == s:reverse() then return count end
    n = n + math.tointeger(tonumber(s:reverse()))
  end
  return -1
end

local out = {}
for _, n in ipairs({ 56, 57, 59, 79, 89 }) do out[#out + 1] = steps(n) end
print(table.concat(out, " "))
