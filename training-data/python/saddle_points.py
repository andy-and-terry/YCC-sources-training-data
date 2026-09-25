def saddle_points(matrix):
    if not matrix:
        return []
    col_mins = [min(col) for col in zip(*matrix)]
    points = []
    for r, row in enumerate(matrix):
        row_max = max(row)
        for c, v in enumerate(row):
            if v == row_max and v == col_mins[c]:
                points.append((r, c))
    return points


if __name__ == "__main__":
    print(saddle_points([[9, 8, 7], [5, 3, 2], [6, 6, 7]]))
