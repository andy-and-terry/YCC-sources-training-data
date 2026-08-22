from typing import List


def transpose(matrix: List[List[int]]) -> List[List[int]]:
    return [list(row) for row in zip(*matrix)]


if __name__ == "__main__":
    m = [[1, 2, 3], [4, 5, 6]]
    print(transpose(m))
