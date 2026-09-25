def island_perimeter(grid):
    per = 0
    for r, row in enumerate(grid):
        for c, v in enumerate(row):
            if v:
                per += 4
                if r and grid[r - 1][c]:
                    per -= 2
                if c and row[c - 1]:
                    per -= 2
    return per


if __name__ == "__main__":
    grid = [[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]]
    print(island_perimeter(grid))
