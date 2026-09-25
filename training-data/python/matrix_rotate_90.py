def rotate_clockwise(m):
    n = len(m)
    for i in range(n):
        for j in range(i + 1, n):
            m[i][j], m[j][i] = m[j][i], m[i][j]
    for row in m:
        row.reverse()
    return m


def rotate_counter(m):
    return [list(r) for r in zip(*m)][::-1]


if __name__ == "__main__":
    m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    for r in rotate_clockwise([row[:] for row in m]):
        print(r)
    print(rotate_counter(m))
