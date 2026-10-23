local function lucas_lehmer(p)
  if p == 2 then return true end
  local m = (1 << p) - 1
  local s = 4
  for _ = 1, p - 2 do
    s = (s * s - 2) % m
  end
  return s == 0
end

local out = {}
for _, p in ipairs({ 2, 3, 5, 7, 11, 13, 17, 19 }) do
  if lucas_lehmer(p) then out[#out + 1] = p end
end
print(table.concat(out, " "))
