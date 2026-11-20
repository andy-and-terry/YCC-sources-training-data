# Polygon area with the shoelace formula.
def area(points):
    s = 0
    for i, (x1, y1) in enumerate(points):
        x2, y2 = points[(i + 1) % len(points)]
        s += x1 * y2 - x2 * y1
    return abs(s) / 2

print(area([(0, 0), (4, 0), (4, 3), (0, 3)]))
