local function equilibrium_index(nums)
  local total = 0
  for _, v in ipairs(nums) do total = total + v end
  local left = 0
  for i, v in ipairs(nums) do
    if left == total - left - v then return i end
    left = left + v
  end
  return nil
end

print(equilibrium_index({1, 7, 3, 6, 5, 6})) -- 4 (1-based)
