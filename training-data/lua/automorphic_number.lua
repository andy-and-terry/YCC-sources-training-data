local function is_automorphic(n)
  local sq = tostring(n * n)
  local s = tostring(n)
  return sq:sub(-#s) == s
end

local out = {}
for n = 1, 999 do
  if is_automorphic(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
