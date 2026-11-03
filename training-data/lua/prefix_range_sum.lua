local RangeSum = {}
RangeSum.__index = RangeSum

function RangeSum.new(values)
  local prefix = { 0 }
  for i, v in ipairs(values) do prefix[i + 1] = prefix[i] + v end
  return setmetatable({ prefix = prefix }, RangeSum)
end

function RangeSum:query(lo, hi)
  return self.prefix[hi + 1] - self.prefix[lo + 1]
end

print(RangeSum.new({ 3, 1, 4, 1, 5, 9, 2, 6 }):query(2, 5))
