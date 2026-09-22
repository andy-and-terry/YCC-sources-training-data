type
  Shape = ref object of RootObj

method area(s: Shape): float {.base.} =
  discard

type
  Circle = ref object of Shape
    radius: float

  Rectangle = ref object of Shape
    width, height: float

method area(s: Circle): float =
  3.14159 * s.radius * s.radius

method area(s: Rectangle): float =
  s.width * s.height

proc createShape(kind: string, a, b: float): Shape =
  case kind
  of "circle": Circle(radius: a)
  of "rectangle": Rectangle(width: a, height: b)
  else: raise newException(ValueError, "unknown shape kind: " & kind)

let shapes = @[
  createShape("circle", 2.0, 0.0),
  createShape("rectangle", 3.0, 4.0)
]
for s in shapes:
  echo area(s)
