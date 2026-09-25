def pascal(rows):
    tri = [[1]]
    for _ in range(rows - 1):
        prev = tri[-1]
        tri.append([1] + [a + b for a, b in zip(prev, prev[1:])] + [1])
    return tri


if __name__ == "__main__":
    t = pascal(7)
    width = len(" ".join(map(str, t[-1])))
    for row in t:
        print(" ".join(map(str, row)).center(width))
