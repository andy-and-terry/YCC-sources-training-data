def max_area(heights)
  lo, hi, best = 0, heights.size - 1, 0
  while lo < hi
    best = [best, [heights[lo], heights[hi]].min * (hi - lo)].max
    heights[lo] < heights[hi] ? lo += 1 : hi -= 1
  end
  best
end

puts max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) # 49
