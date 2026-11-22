-- Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
local r, out = 0, {}
for _ = 1, 8 do
  r = r * 10 + 1
  out[#out + 1] = r
end
print(table.concat(out, " "))
