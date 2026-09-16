local function sliding_window_maximum(nums, k)
  local deque = {}
  local result = {}
  local head, tail = 1, 0

  for i, v in ipairs(nums) do
    while tail >= head and deque[tail] <= i - k do
      tail = tail - 1
    end
    while tail >= head and nums[deque[tail]] <= v do
      tail = tail - 1
    end
    tail = tail + 1
    deque[tail] = i

    if i >= k then
      table.insert(result, nums[deque[head]])
    end
  end

  return result
end

local nums = { 1, 3, -1, -3, 5, 3, 6, 7 }
print(table.concat(sliding_window_maximum(nums, 3), " "))
