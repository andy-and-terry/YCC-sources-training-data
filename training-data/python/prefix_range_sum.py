class RangeSum:
    def __init__(self, values):
        self.prefix = [0]
        for v in values:
            self.prefix.append(self.prefix[-1] + v)

    def query(self, lo: int, hi: int) -> int:
        """Sum of values[lo:hi]."""
        return self.prefix[hi] - self.prefix[lo]


if __name__ == "__main__":
    rs = RangeSum([3, 1, 4, 1, 5, 9, 2, 6])
    print(rs.query(2, 5))
