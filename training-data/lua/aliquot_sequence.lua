-- Aliquot sequence: replace n by the sum of its proper divisors.
local function aliquot_sum(n)
  local s = 0
  for d = 1, n // 2 do
    if n % d == 0 then s = s + d end
  end
  return s
end

local seq = { 12 }
while seq[#seq] > 1 and #seq < 20 do
  seq[#seq + 1] = aliquot_sum(seq[#seq])
end
print(table.concat(seq, " "))
