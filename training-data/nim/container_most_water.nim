proc maxArea(h: seq[int]): int =
  var lo = 0
  var hi = h.high
  while lo < hi:
    result = max(result, min(h[lo], h[hi]) * (hi - lo))
    if h[lo] < h[hi]: inc lo else: dec hi

echo maxArea(@[1, 8, 6, 2, 5, 4, 8, 3, 7]) # 49
