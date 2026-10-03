def trap(heights : Array(Int32)) : Int32
  return 0 if heights.empty?

  left, right = 0, heights.size - 1
  left_max, right_max = heights[left], heights[right]
  water = 0

  while left < right
    if left_max < right_max
      left += 1
      left_max = Math.max(left_max, heights[left])
      water += left_max - heights[left]
    else
      right -= 1
      right_max = Math.max(right_max, heights[right])
      water += right_max - heights[right]
    end
  end

  water
end

puts trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
