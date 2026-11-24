-- Fibbinary numbers: no two adjacent 1 bits.
local out = {}
for n = 0, 49 do
  if n & (n >> 1) == 0 then out[#out + 1] = n end
end
print(table.concat(out, " "))
