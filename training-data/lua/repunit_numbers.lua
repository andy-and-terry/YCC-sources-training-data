-- Repunits: numbers made only of the digit 1.
local r, out = 0, {}
for _ = 1, 5 do
  r = r * 10 + 1
  out[#out + 1] = r
end
print(table.concat(out, " "))
