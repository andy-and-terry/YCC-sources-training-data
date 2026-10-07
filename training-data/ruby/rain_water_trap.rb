def trap(heights)
  left = heights.each_with_object([]) { |h, acc| acc << [h, acc.last || 0].max }
  right = heights.reverse.each_with_object([]) { |h, acc| acc << [h, acc.last || 0].max }.reverse
  heights.each_index.sum { |i| [left[i], right[i]].min - heights[i] }
end

p trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), trap([4, 2, 0, 3, 2, 5])
