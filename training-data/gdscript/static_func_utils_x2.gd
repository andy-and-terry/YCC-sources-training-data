class_name MathUtilsX2

static func clamp01(x: float) -> float:
    return clamp(x, 0.0, 1.0)

static func remap(v: float, a: float, b: float, c: float, d: float) -> float:
    return c + (v - a) * (d - c) / (b - a)
