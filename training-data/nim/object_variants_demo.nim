type
  ShapeKind = enum skCircle, skRect
  Shape = object
    case kind: ShapeKind
    of skCircle:
      radius: float
    of skRect:
      w, h: float

proc area(s: Shape): float =
  case s.kind
  of skCircle: 3.14159 * s.radius * s.radius
  of skRect: s.w * s.h

echo area(Shape(kind: skRect, w: 3.0, h: 4.0))
echo area(Shape(kind: skCircle, radius: 1.0))
