# Shoelace polygon area.
type Point = tuple[x, y: float]

proc area(p: openArray[Point]): float =
  for i in 0 ..< p.len:
    let q = p[(i + 1) mod p.len]
    result += p[i].x * q.y - q.x * p[i].y
  abs(result) / 2

echo area([(0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0)])
