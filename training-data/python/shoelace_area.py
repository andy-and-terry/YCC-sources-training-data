def shoelace(pts):
    n = len(pts)
    s = sum(pts[i][0] * pts[(i + 1) % n][1] - pts[(i + 1) % n][0] * pts[i][1] for i in range(n))
    return abs(s) / 2


if __name__ == "__main__":
    print(shoelace([(0, 0), (4, 0), (4, 3), (0, 3)]))
