from collections import deque

# Fixed-size ring buffer using deque(maxlen=...): old items fall off the left.
class RingBuffer:
    def __init__(self, capacity):
        self._items = deque(maxlen=capacity)

    def push(self, item):
        self._items.append(item)

    def snapshot(self):
        return list(self._items)

    def average(self):
        return sum(self._items) / len(self._items) if self._items else 0.0

if __name__ == "__main__":
    rb = RingBuffer(3)
    for n in range(1, 6):
        rb.push(n)
    print(rb.snapshot(), rb.average())  # [3, 4, 5] 4.0
