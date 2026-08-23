type Direction = enum
  North, South, East, West

proc describe(d: Direction): string =
  case d
  of North: "going up"
  of South: "going down"
  of East: "going right"
  of West: "going left"

echo describe(North)
echo describe(West)
