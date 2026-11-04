class MinStack:
    """Stack that reports its minimum in O(1) by pairing each value with the running min."""

    def __init__(self):
        self._items = []

    def push(self, x):
        cur = min(x, self._items[-1][1]) if self._items else x
        self._items.append((x, cur))

    def pop(self):
        return self._items.pop()[0]

    def minimum(self):
        return self._items[-1][1]


s = MinStack()
for v in (5, 3, 7, 2):
    s.push(v)
print(s.minimum())  # 2
s.pop()
print(s.minimum())  # 3
