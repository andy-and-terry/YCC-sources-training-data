local function two_sum(nums, target)
  local seen = {}
  for i, n in ipairs(nums) do
    local complement = target - n
    if seen[complement] then
      return seen[complement], i
    end
    seen[n] = i
  end
  return nil
end

print(two_sum({ 2, 7, 11, 15 }, 9))
