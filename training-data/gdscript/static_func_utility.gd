class_name MathUtil

static func lerp_clamped(a: float, b: float, t: float) -> float:
    return a + (b - a) * clamp(t, 0.0, 1.0)

static func wrap_index(i: int, n: int) -> int:
    return posmod(i, n)
