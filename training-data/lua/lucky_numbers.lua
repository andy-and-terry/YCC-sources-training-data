local function lucky_numbers(limit)
  local nums = {}
  for v = 1, limit - 1, 2 do
    nums[#nums + 1] = v
  end
  local i = 2
  while i <= #nums and nums[i] <= #nums do
    local step = nums[i]
    local kept = {}
    for idx, value in ipairs(nums) do
      if idx % step ~= 0 then
        kept[#kept + 1] = value
      end
    end
    nums = kept
    i = i + 1
  end
  return nums
end

print(table.concat(lucky_numbers(100), " "))
