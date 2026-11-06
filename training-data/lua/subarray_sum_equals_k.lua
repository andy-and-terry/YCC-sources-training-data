-- Count contiguous subarrays whose sum equals k (prefix sums + table).
local function count_subarrays(nums, k)
  local seen = { [0] = 1 }
  local total, count = 0, 0
  for _, x in ipairs(nums) do
    total = total + x
    count = count + (seen[total - k] or 0)
    seen[total] = (seen[total] or 0) + 1
  end
  return count
end

print(count_subarrays({1, 1, 1}, 2))
