-- Leyland numbers: x^y + y^x for x >= y >= 2.
local vals = {}
for x = 2, 4 do
  for y = 2, x do
    vals[#vals + 1] = string.format("%d", x ^ y + y ^ x)
  end
end
print(table.concat(vals, " "))
