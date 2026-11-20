-- Bead (gravity) sort.
local function bead_sort(nums)
  local max = math.max(table.unpack(nums))
  local cols = {}
  for i = 1, max do cols[i] = 0 end
  for _, n in ipairs(nums) do for i = 1, n do cols[i] = cols[i] + 1 end end
  local rows = {}
  for r = 1, #nums do
    local c = 0
    for _, v in ipairs(cols) do if v >= r then c = c + 1 end end
    table.insert(rows, 1, c)
  end
  return rows
end
print(table.concat(bead_sort({5, 3, 1, 4, 2}), ","))
