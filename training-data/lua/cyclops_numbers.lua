-- Cyclops numbers: odd digit count, middle digit zero, no other zeros.
-- Count those in 1..99999 (expected 6642).
local function is_cyclops(n)
  local s = tostring(n)
  local len = #s
  local _, zeros = s:gsub("0", "")
  return len % 2 == 1 and s:sub(len // 2 + 1, len // 2 + 1) == "0" and zeros == 1
end

local count = 0
for n = 1, 99999 do
  if is_cyclops(n) then count = count + 1 end
end
print(count)
