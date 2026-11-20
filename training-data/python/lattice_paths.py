# Count monotone paths through an n x n grid with a 1-D DP table.
def lattice_paths(n):
    row = [1] * (n + 1)
    for _ in range(n):
        for j in range(1, n + 1):
            row[j] += row[j - 1]
    return row[n]

print(lattice_paths(3))
