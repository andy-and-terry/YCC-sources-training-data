def sliding_window_maximum(nums : Array(Int32), k : Int32) : Array(Int32)
  result = [] of Int32
  deque = Deque(Int32).new

  nums.each_with_index do |num, i|
    deque.shift while !deque.empty? && deque.first < i - k + 1
    deque.pop while !deque.empty? && nums[deque.last] < num
    deque.push(i)
    result << nums[deque.first] if i >= k - 1
  end

  result
end

p sliding_window_maximum([1, 3, -1, -3, 5, 3, 6, 7], 3)
p sliding_window_maximum([9, 11], 2)
