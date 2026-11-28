proc area(pts: seq[(float, float)]): float =
  var s = 0.0
  for i in 0 ..< pts.len:
    let (x1, y1) = pts[i]
    let (x2, y2) = pts[(i + 1) mod pts.len]
    s += x1 * y2 - x2 * y1
  abs(s) / 2.0

echo area(@[(0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0)])
