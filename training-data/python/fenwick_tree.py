class FenwickTree:
    def __init__(self, size):
        self.size = size
        self.tree = [0] * (size + 1)

    def add(self, index, delta):
        index += 1
        while index <= self.size:
            self.tree[index] += delta
            index += index & (-index)

    def prefix_sum(self, index):
        index += 1
        total = 0
        while index > 0:
            total += self.tree[index]
            index -= index & (-index)
        return total

    def range_sum(self, left, right):
        return self.prefix_sum(right) - (self.prefix_sum(left - 1) if left > 0 else 0)


if __name__ == "__main__":
    ft = FenwickTree(6)
    for i, v in enumerate([1, 3, 5, 7, 9, 11]):
        ft.add(i, v)
    print(ft.range_sum(1, 3))
