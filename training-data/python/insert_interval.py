def insert(intervals, new):
    out, i, n = [], 0, len(intervals)
    while i < n and intervals[i][1] < new[0]:
        out.append(intervals[i])
        i += 1
    while i < n and intervals[i][0] <= new[1]:
        new = [min(new[0], intervals[i][0]), max(new[1], intervals[i][1])]
        i += 1
    out.append(new)
    out.extend(intervals[i:])
    return out


print(insert([[1, 3], [6, 9]], [2, 5]))  # [[1, 5], [6, 9]]
print(insert([[1, 2], [3, 5], [6, 7], [8, 10]], [4, 8]))  # [[1, 2], [3, 10]]
