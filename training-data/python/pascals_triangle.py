from typing import List


def pascals_triangle(rows: int) -> List[List[int]]:
    triangle: List[List[int]] = []
    for i in range(rows):
        row = [1] * (i + 1)
        for j in range(1, i):
            row[j] = triangle[i - 1][j - 1] + triangle[i - 1][j]
        triangle.append(row)
    return triangle


if __name__ == "__main__":
    for row in pascals_triangle(6):
        print(row)
