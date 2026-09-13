type
  ShapeKind = enum
    skCircle, skRectangle

  Shape = object
    case kind: ShapeKind
    of skCircle:
      radius: float
    of skRectangle:
      width, height: float

proc area(s: Shape): float =
  case s.kind
  of skCircle: 3.14159 * s.radius * s.radius
  of skRectangle: s.width * s.height

let shapes = @[
  Shape(kind: skCircle, radius: 2.0),
  Shape(kind: skRectangle, width: 3.0, height: 4.0)
]
for s in shapes:
  echo area(s)
