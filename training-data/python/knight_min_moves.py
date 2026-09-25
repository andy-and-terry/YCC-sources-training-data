from collections import deque

MOVES = [(1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2)]


def knight_distance(n, start, goal):
    if start == goal:
        return 0
    seen = {start}
    q = deque([(start, 0)])
    while q:
        (x, y), d = q.popleft()
        for dx, dy in MOVES:
            nxt = (x + dx, y + dy)
            if 0 <= nxt[0] < n and 0 <= nxt[1] < n and nxt not in seen:
                if nxt == goal:
                    return d + 1
                seen.add(nxt)
                q.append((nxt, d + 1))
    return -1


if __name__ == "__main__":
    print(knight_distance(8, (0, 0), (7, 7)))
    print(knight_distance(8, (0, 0), (1, 1)))
