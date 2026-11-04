def is_toeplitz(m):
    return all(m[i][j] == m[i - 1][j - 1]
               for i in range(1, len(m)) for j in range(1, len(m[0])))


print(is_toeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]]))  # True
print(is_toeplitz([[1, 2], [2, 2]]))  # False
