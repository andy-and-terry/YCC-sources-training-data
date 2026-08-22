type
  Point = object
    x, y: float

proc `+`(a, b: Point): Point =
  Point(x: a.x + b.x, y: a.y + b.y)

let p1 = Point(x: 1.0, y: 2.0)
let p2 = Point(x: 3.0, y: 4.0)
echo p1 + p2
