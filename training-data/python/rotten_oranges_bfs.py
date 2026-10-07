from collections import deque


def minutes_to_rot(grid):
    grid = [row[:] for row in grid]
    q = deque()
    fresh = 0
    for r, row in enumerate(grid):
        for c, v in enumerate(row):
            if v == 2:
                q.append((r, c, 0))
            elif v == 1:
                fresh += 1
    minutes = 0
    while q:
        r, c, t = q.popleft()
        minutes = max(minutes, t)
        for dr, dc in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nr, nc = r + dr, c + dc
            if 0 <= nr < len(grid) and 0 <= nc < len(grid[0]) and grid[nr][nc] == 1:
                grid[nr][nc] = 2
                fresh -= 1
                q.append((nr, nc, t + 1))
    return minutes if fresh == 0 else -1


if __name__ == "__main__":
    print(minutes_to_rot([[2, 1, 1], [1, 1, 0], [0, 1, 1]]))
    print(minutes_to_rot([[2, 1, 1], [0, 1, 1], [1, 0, 1]]))
