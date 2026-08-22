import math


class SparseTable:
    def __init__(self, data):
        n = len(data)
        k = int(math.log2(n)) + 1
        self.table = [[0] * k for _ in range(n)]
        for i in range(n):
            self.table[i][0] = data[i]
        j = 1
        while (1 << j) <= n:
            i = 0
            while i + (1 << j) <= n:
                self.table[i][j] = min(self.table[i][j - 1], self.table[i + (1 << (j - 1))][j - 1])
                i += 1
            j += 1

    def query_min(self, left, right):
        length = right - left + 1
        j = int(math.log2(length))
        return min(self.table[left][j], self.table[right - (1 << j) + 1][j])


if __name__ == "__main__":
    st = SparseTable([5, 2, 4, 7, 6, 3, 1, 2])
    print(st.query_min(1, 5))
