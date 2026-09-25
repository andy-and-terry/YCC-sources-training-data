def solve(maze):
    n = len(maze)
    paths = []
    seen = [[False] * n for _ in range(n)]
    moves = [("D", 1, 0), ("L", 0, -1), ("R", 0, 1), ("U", -1, 0)]

    def go(r, c, path):
        if r == n - 1 and c == n - 1:
            paths.append(path)
            return
        seen[r][c] = True
        for name, dr, dc in moves:
            nr, nc = r + dr, c + dc
            if 0 <= nr < n and 0 <= nc < n and maze[nr][nc] and not seen[nr][nc]:
                go(nr, nc, path + name)
        seen[r][c] = False

    if maze[0][0]:
        go(0, 0, "")
    return paths


if __name__ == "__main__":
    maze = [[1, 0, 0, 0], [1, 1, 0, 1], [1, 1, 0, 0], [0, 1, 1, 1]]
    print(solve(maze))
