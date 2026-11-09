type V2 = object
  x, y: int

proc `+`(a, b: V2): V2 = V2(x: a.x + b.x, y: a.y + b.y)
proc `$`(v: V2): string = "(" & $v.x & "," & $v.y & ")"

echo V2(x: 1, y: 2) + V2(x: 3, y: 4)
