def spiral(n):
    grid = [[0] * n for _ in range(n)]
    top, left, bottom, right = 0, 0, n - 1, n - 1
    k = 1
    while top <= bottom and left <= right:
        for c in range(left, right + 1):
            grid[top][c] = k; k += 1
        top += 1
        for r in range(top, bottom + 1):
            grid[r][right] = k; k += 1
        right -= 1
        if top <= bottom:
            for c in range(right, left - 1, -1):
                grid[bottom][c] = k; k += 1
            bottom -= 1
        if left <= right:
            for r in range(bottom, top - 1, -1):
                grid[r][left] = k; k += 1
            left += 1
    return grid


if __name__ == "__main__":
    for row in spiral(4):
        print(" ".join(f"{v:2}" for v in row))
