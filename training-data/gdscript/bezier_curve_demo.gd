extends Node

# Evaluate quadratic and cubic Bezier curves, built from repeated lerps,
# and compare with the built-in Vector2.bezier_interpolate.

func quadratic(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	var a := p0.lerp(p1, t)
	var b := p1.lerp(p2, t)
	return a.lerp(b, t)

func cubic(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, t: float) -> Vector2:
	var a := quadratic(p0, p1, p2, t)
	var b := quadratic(p1, p2, p3, t)
	return a.lerp(b, t)

func sample(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, steps: int) -> PackedVector2Array:
	var points := PackedVector2Array()
	for i in range(steps + 1):
		points.append(cubic(p0, p1, p2, p3, float(i) / steps))
	return points

func polyline_length(points: PackedVector2Array) -> float:
	var total := 0.0
	for i in range(1, points.size()):
		total += points[i - 1].distance_to(points[i])
	return total

func _ready():
	var p0 := Vector2(0, 0)
	var p1 := Vector2(0, 100)
	var p2 := Vector2(100, 100)
	var p3 := Vector2(100, 0)

	print(quadratic(p0, p1, p2, 0.5))
	print(cubic(p0, p1, p2, p3, 0.0))
	print(cubic(p0, p1, p2, p3, 0.5))
	print(cubic(p0, p1, p2, p3, 1.0))
	print(p0.bezier_interpolate(p1, p2, p3, 0.5))

	var pts := sample(p0, p1, p2, p3, 20)
	print("points: ", pts.size())
	print("approx length: ", snappedf(polyline_length(pts), 0.1))
