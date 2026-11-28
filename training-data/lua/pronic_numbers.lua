local function is_pronic(x)
  local n = math.floor(math.sqrt(x))
  return n * (n + 1) == x
end

local out = {}
for n = 0, 9 do out[#out + 1] = n * (n + 1) end
print(table.concat(out, " "))              -- 0 2 6 12 20 30 42 56 72 90
print(is_pronic(56), is_pronic(57))        -- true false
