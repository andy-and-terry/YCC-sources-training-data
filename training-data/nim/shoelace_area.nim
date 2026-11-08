proc area(pts: seq[(float, float)]): float =
  var s = 0.0
  for i in 0 ..< pts.len:
    let j = (i + 1) mod pts.len
    s += pts[i][0] * pts[j][1] - pts[j][0] * pts[i][1]
  abs(s) / 2

echo area(@[(0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0)])
