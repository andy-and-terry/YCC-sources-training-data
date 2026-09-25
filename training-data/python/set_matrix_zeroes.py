def set_zeroes(m):
    rows, cols = len(m), len(m[0])
    first_row_zero = any(v == 0 for v in m[0])
    first_col_zero = any(m[r][0] == 0 for r in range(rows))
    for r in range(1, rows):
        for c in range(1, cols):
            if m[r][c] == 0:
                m[r][0] = m[0][c] = 0
    for r in range(1, rows):
        for c in range(1, cols):
            if m[r][0] == 0 or m[0][c] == 0:
                m[r][c] = 0
    if first_row_zero:
        m[0] = [0] * cols
    if first_col_zero:
        for r in range(rows):
            m[r][0] = 0
    return m


if __name__ == "__main__":
    for row in set_zeroes([[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]):
        print(row)
