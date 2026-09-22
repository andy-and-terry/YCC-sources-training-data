type
  ShapeKind = enum
    skCircle, skSquare

  Shape = ref object of RootObj

  Circle = ref object of Shape
    radius: float

  Square = ref object of Shape
    side: float

method area(s: Shape): float {.base.} =
  discard

method area(s: Circle): float =
  3.14159 * s.radius * s.radius

method area(s: Square): float =
  s.side * s.side

proc createShape(kind: ShapeKind): Shape =
  case kind
  of skCircle:
    Circle(radius: 2.0)
  of skSquare:
    Square(side: 3.0)

for kind in [skCircle, skSquare]:
  let shape = createShape(kind)
  echo area(shape)
