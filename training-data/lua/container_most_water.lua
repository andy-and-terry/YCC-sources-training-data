local function max_area(h)
  local lo, hi, best = 1, #h, 0
  while lo < hi do
    best = math.max(best, math.min(h[lo], h[hi]) * (hi - lo))
    if h[lo] < h[hi] then lo = lo + 1 else hi = hi - 1 end
  end
  return best
end

print(max_area({1, 8, 6, 2, 5, 4, 8, 3, 7})) -- 49
