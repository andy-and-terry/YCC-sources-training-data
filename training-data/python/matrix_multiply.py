from typing import List


def multiply(a: List[List[float]], b: List[List[float]]) -> List[List[float]]:
    rows_a, cols_a = len(a), len(a[0])
    rows_b, cols_b = len(b), len(b[0])
    if cols_a != rows_b:
        raise ValueError("incompatible matrix dimensions")

    result = [[0.0] * cols_b for _ in range(rows_a)]
    for i in range(rows_a):
        for j in range(cols_b):
            result[i][j] = sum(a[i][k] * b[k][j] for k in range(cols_a))
    return result


if __name__ == "__main__":
    a = [[1, 2], [3, 4]]
    b = [[5, 6], [7, 8]]
    print(multiply(a, b))
