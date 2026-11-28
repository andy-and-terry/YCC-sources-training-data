def max_area(h : Array(Int32)) : Int32
  lo, hi, best = 0, h.size - 1, 0
  while lo < hi
    best = {best, {h[lo], h[hi]}.min * (hi - lo)}.max
    h[lo] < h[hi] ? (lo += 1) : (hi -= 1)
  end
  best
end

puts max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) # 49
