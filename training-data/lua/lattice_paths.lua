-- Lattice paths with a DP row.
local function lattice(n)
  local row = {}
  for j = 0, n do row[j] = 1 end
  for _ = 1, n do for j = 1, n do row[j] = row[j] + row[j - 1] end end
  return row[n]
end
print(lattice(3))
