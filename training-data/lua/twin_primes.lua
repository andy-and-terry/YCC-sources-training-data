local limit = 80
local composite = {}
for i = 2, math.floor(math.sqrt(limit)) do
  if not composite[i] then
    for j = i * i, limit, i do composite[j] = true end
  end
end
local pairs_out = {}
for p = 3, limit - 2 do
  if not composite[p] and not composite[p + 2] then
    pairs_out[#pairs_out + 1] = string.format("(%d,%d)", p, p + 2)
  end
end
print(table.concat(pairs_out, " ")) -- (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
