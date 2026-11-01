-- n is triangular iff 8n + 1 is a perfect square.
local function is_triangular(n)
  local s = 8 * n + 1
  local r = math.floor(math.sqrt(s) + 0.5)
  return r * r == s
end

local out = {}
for n = 0, 20 do
  if is_triangular(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
