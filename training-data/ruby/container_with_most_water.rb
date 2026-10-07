def max_area(h)
  lo = 0
  hi = h.size - 1
  best = [0, 0, 0]
  while lo < hi
    area = (hi - lo) * [h[lo], h[hi]].min
    best = [area, lo, hi] if area > best[0]
    h[lo] < h[hi] ? lo += 1 : hi -= 1
  end
  best
end

area, l, r = max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])
puts "area #{area} between #{l} and #{r}"
