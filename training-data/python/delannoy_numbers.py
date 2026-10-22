def central_delannoy(count: int) -> list[int]:
    size = count
    grid = [[1] * size for _ in range(size)]
    for m in range(1, size):
        for n in range(1, size):
            grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1]
    return [grid[k][k] for k in range(count)]


if __name__ == "__main__":
    print(" ".join(map(str, central_delannoy(10))))
