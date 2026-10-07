local function pair_with_sum(nums, target)
  local i, j = 1, #nums
  while i < j do
    local s = nums[i] + nums[j]
    if s == target then return i, j end
    if s < target then i = i + 1 else j = j - 1 end
  end
  return nil
end

print(pair_with_sum({ 1, 3, 4, 6, 8, 11 }, 10))
print(pair_with_sum({ 1, 2, 3 }, 100))
