from collections import deque


def flood_fill(grid, r, c, new):
    old = grid[r][c]
    if old == new:
        return grid
    q = deque([(r, c)])
    grid[r][c] = new
    while q:
        y, x = q.popleft()
        for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            ny, nx = y + dy, x + dx
            if 0 <= ny < len(grid) and 0 <= nx < len(grid[0]) and grid[ny][nx] == old:
                grid[ny][nx] = new
                q.append((ny, nx))
    return grid


if __name__ == "__main__":
    img = [list("..##."), list(".#..#"), list(".#..#"), list("..##.")]
    for row in flood_fill(img, 1, 2, "o"):
        print("".join(row))
