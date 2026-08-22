class MinStack:
    def __init__(self):
        self._items = []
        self._mins = []

    def push(self, value):
        self._items.append(value)
        self._mins.append(value if not self._mins else min(value, self._mins[-1]))

    def pop(self):
        self._mins.pop()
        return self._items.pop()

    def top(self):
        return self._items[-1]

    def get_min(self):
        return self._mins[-1]


if __name__ == "__main__":
    s = MinStack()
    s.push(3)
    s.push(1)
    s.push(2)
    print(s.get_min())
    s.pop()
    print(s.get_min())
