class Deque:
    """Ring-buffer deque with automatic growth."""

    def __init__(self, capacity=4):
        self._buf = [None] * capacity
        self._head = 0
        self._size = 0

    def __len__(self):
        return self._size

    def _grow(self):
        old = [self._buf[(self._head + i) % len(self._buf)] for i in range(self._size)]
        self._buf = old + [None] * len(old)
        self._head = 0

    def push_back(self, x):
        if self._size == len(self._buf):
            self._grow()
        self._buf[(self._head + self._size) % len(self._buf)] = x
        self._size += 1

    def push_front(self, x):
        if self._size == len(self._buf):
            self._grow()
        self._head = (self._head - 1) % len(self._buf)
        self._buf[self._head] = x
        self._size += 1

    def pop_front(self):
        if not self._size:
            raise IndexError("empty deque")
        x = self._buf[self._head]
        self._buf[self._head] = None
        self._head = (self._head + 1) % len(self._buf)
        self._size -= 1
        return x

    def pop_back(self):
        if not self._size:
            raise IndexError("empty deque")
        i = (self._head + self._size - 1) % len(self._buf)
        x, self._buf[i] = self._buf[i], None
        self._size -= 1
        return x

    def __iter__(self):
        for i in range(self._size):
            yield self._buf[(self._head + i) % len(self._buf)]


if __name__ == "__main__":
    d = Deque()
    for i in range(5):
        d.push_back(i)
        d.push_front(-i)
    print(list(d))
    print(d.pop_front(), d.pop_back(), list(d))
