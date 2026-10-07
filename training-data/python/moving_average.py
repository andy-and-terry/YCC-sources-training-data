from collections import deque


class MovingAverage:
    def __init__(self, size: int):
        self.window = deque(maxlen=size)
        self.total = 0.0

    def next(self, value: float) -> float:
        if len(self.window) == self.window.maxlen:
            self.total -= self.window[0]
        self.window.append(value)
        self.total += value
        return self.total / len(self.window)


if __name__ == "__main__":
    ma = MovingAverage(3)
    print([round(ma.next(v), 2) for v in [1, 10, 3, 5, 8, 2]])
