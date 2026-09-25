def classify(a, b, c):
    sides = sorted([a, b, c])
    if sides[0] <= 0 or sides[0] + sides[1] <= sides[2]:
        return "invalid"
    if a == b == c:
        return "equilateral"
    if a == b or b == c or a == c:
        return "isosceles"
    return "scalene"


if __name__ == "__main__":
    for t in [(3, 3, 3), (3, 4, 4), (3, 4, 5), (1, 1, 3)]:
        print(t, classify(*t))
