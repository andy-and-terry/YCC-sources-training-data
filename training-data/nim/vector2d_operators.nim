type
  Vector2D = object
    x, y: float

proc `+`(a, b: Vector2D): Vector2D = Vector2D(x: a.x + b.x, y: a.y + b.y)
proc `-`(a, b: Vector2D): Vector2D = Vector2D(x: a.x - b.x, y: a.y - b.y)
proc `-`(a: Vector2D): Vector2D = Vector2D(x: -a.x, y: -a.y)
proc `*`(a: Vector2D, scalar: float): Vector2D = Vector2D(x: a.x * scalar, y: a.y * scalar)
proc `==`(a, b: Vector2D): bool = a.x == b.x and a.y == b.y
proc `$`(v: Vector2D): string = "(" & $v.x & ", " & $v.y & ")"
proc dot(a, b: Vector2D): float = a.x * b.x + a.y * b.y

let a = Vector2D(x: 1.0, y: 2.0)
let b = Vector2D(x: 3.0, y: 4.0)
echo a + b
echo a - b
echo a * 2.0
echo -a
echo a == Vector2D(x: 1.0, y: 2.0)
echo dot(a, b)
