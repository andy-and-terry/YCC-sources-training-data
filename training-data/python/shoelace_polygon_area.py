def area(pts):
    s = 0
    for i, (x1, y1) in enumerate(pts):
        x2, y2 = pts[(i + 1) % len(pts)]
        s += x1 * y2 - x2 * y1
    return abs(s) / 2


if __name__ == "__main__":
    print(area([(0, 0), (4, 0), (4, 3), (0, 3)]))  # 12.0
