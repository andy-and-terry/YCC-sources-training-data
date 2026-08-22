class CircularBuffer:
    def __init__(self, capacity: int):
        self.capacity = capacity
        self.buffer = [None] * capacity
        self.head = 0
        self.size = 0

    def append(self, item):
        tail = (self.head + self.size) % self.capacity
        self.buffer[tail] = item
        if self.size < self.capacity:
            self.size += 1
        else:
            self.head = (self.head + 1) % self.capacity

    def to_list(self):
        return [self.buffer[(self.head + i) % self.capacity] for i in range(self.size)]


if __name__ == "__main__":
    cb = CircularBuffer(3)
    for i in range(5):
        cb.append(i)
    print(cb.to_list())
