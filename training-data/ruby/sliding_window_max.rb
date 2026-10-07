def sliding_window_max(nums, k)
  deque = [] # stores indices, values decreasing left to right
  result = []

  nums.each_with_index do |num, i|
    deque.shift while deque.any? && deque.first <= i - k
    deque.pop while deque.any? && nums[deque.last] <= num
    deque.push(i)
    result << nums[deque.first] if i >= k - 1
  end
  result
end

puts sliding_window_max([1, 3, -1, -3, 5, 3, 6, 7], 3).inspect
puts sliding_window_max([9, 8, 7, 6], 2).inspect
