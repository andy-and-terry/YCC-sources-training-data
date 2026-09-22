type
  Summable = concept x
    x + x is typeof(x)

proc sumAll[T: Summable](items: seq[T]): T =
  result = default(T)
  for it in items:
    result = result + it

echo sumAll(@[1, 2, 3, 4])
echo sumAll(@[1.5, 2.5, 3.0])

type
  Point = object
    x, y: int

proc `+`(a, b: Point): Point = Point(x: a.x + b.x, y: a.y + b.y)

echo sumAll(@[Point(x: 1, y: 1), Point(x: 2, y: 3)])
