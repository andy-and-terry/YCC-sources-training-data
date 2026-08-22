class SegmentTree:
    def __init__(self, data):
        self.n = len(data)
        self.tree = [0] * (2 * self.n)
        for i, value in enumerate(data):
            self.tree[self.n + i] = value
        for i in range(self.n - 1, 0, -1):
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]

    def update(self, index, value):
        i = index + self.n
        self.tree[i] = value
        while i > 1:
            i //= 2
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]

    def query(self, left, right):
        left += self.n
        right += self.n
        total = 0
        while left < right:
            if left % 2 == 1:
                total += self.tree[left]
                left += 1
            if right % 2 == 1:
                right -= 1
                total += self.tree[right]
            left //= 2
            right //= 2
        return total


if __name__ == "__main__":
    tree = SegmentTree([1, 3, 5, 7, 9, 11])
    print(tree.query(1, 4))
    tree.update(1, 10)
    print(tree.query(1, 4))
